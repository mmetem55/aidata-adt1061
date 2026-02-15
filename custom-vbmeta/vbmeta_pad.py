import hashlib
import os

input_name = "vbmeta-sign-custom.img"
output_name = "vbmeta-sign-custom1.img"
total_size = 1048576
dhtb_data_limit = 20480

# read a file
with open(input_name, "rb") as f:
    raw_data = f.read()

# avbtool padding 2048 check
if len(raw_data) < dhtb_data_limit:
    raw_data = raw_data + (b'\x00' * (dhtb_data_limit - len(raw_data)))
else:
    raw_data = raw_data[:dhtb_data_limit]

# 1MB
full_file = raw_data + (b'\x00' * (total_size - dhtb_data_limit))

sha = hashlib.sha256(raw_data).digest()

# add DHTB footer
with open(output_name, "wb") as f:
    f.write(full_file)
    f.seek(total_size - 512)
    f.write(b'\x44\x48\x54\x42\x01\x00\x00\x00') # DHTB Magic
    f.write(sha)                               # Hash
    # Buradaki \x50\x00\x00 kısmı dhtb_data_limit (20480) ile eşleşiyor
    f.write(b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x00\x00')
    f.seek(total_size - 1)
    f.write(b'\x00')

print(f"--- Dosya flashlanmaya hazır ---")
print(f"Flashlanacak dosya: {output_name}")
