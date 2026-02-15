# Aşağıdaki adımları takip ederek Aidata Alim 10 cihazı için imzalı vbmeta dosyası oluşturabilirsiniz. Ayrıca vbmeta imajına uygun şekilde kendi imajlarınızıda imzalayabilirsiniz.
# 
#
## Başlamadan önce bu klasörü [indirin](https://drive.google.com/file/d/1i4MIuPpgBDSdMoQ-jzBdJU6tQvy7LjXM/view?usp=sharing) ve çıkartın.
#
### 1) Kendi imaj dosyalarınızı (.img) flashlamak için bu komuttaki partition keyi "custom_key.bin" ile değiştirin. 

```bash
python avbtool.py make_vbmeta_image \                                                                                                                 ─╯
--key rsa4096_vbmeta.pem \
--algorithm SHA256_RSA4096 \
--flag 0 \
--padding_size 20480 \
--chain_partition boot:1:keys/boot_key.bin \
--chain_partition dtbo:5:keys/dtbo_key.bin \
--chain_partition recovery:2:keys/recovery_key.bin \
--chain_partition socko:6:keys/socko_key.bin \
--chain_partition odmko:7:keys/odmko_key.bin \
--chain_partition vbmeta_system:3:keys/vbmeta_system_key.bin \
--chain_partition vbmeta_vendor:4:keys/vbmeta_vendor_key.bin \
--chain_partition l_modem:8:keys/l_modem_key.bin \
--chain_partition l_ldsp:9:keys/l_ldsp_key.bin \
--chain_partition l_gdsp:10:keys/l_gdsp_key.bin \
--chain_partition pm_sys:11:keys/pm_sys_key.bin \
--chain_partition l_agdsp:12:keys/l_agdsp_key.bin \
--chain_partition l_cdsp:13:keys/l_cdsp_key.bin \
--output vbmeta-sign-custom.img
```
### 2) Aşağıdaki komutu çalıştırın.

python vbmeta_pad.py

### "--- Dosya flashlanmaya hazır ---" custom çıktısını gördüyseniz vbmeta dosyanız hazır demektir.

### 3) Oluşturduğunuz veya flashlamak istediğiniz imajı bu klasöre kopyalayın.

### 4) Aşağıdaki komutunun "xxx" bölümünü değiştirmek istediğiniz bölümün adını yazın ve komutu çalıştırın.

python avbtool.py info_image --image xxx.img 

### 5) Aşağıdaki çıktı gibi bir çıktı çıkacakdır bunu bir yere not edin. Image Size: (Örn: 36700160) Partition Name: (Örn: boot) Salt: (Örn: 7495b86f...e6f0b44e35)
```bash
Footer version:           1.0
Image size:               36700160 bytes
Original image size:      19062784 bytes
VBMeta offset:            19062784
VBMeta size:              2176 bytes
--
Minimum libavb version:   1.0
Header Block:             256 bytes
Authentication Block:     576 bytes
Auxiliary Block:          1344 bytes
Public key (sha1):        ea410c1b46cdb2e40e526880ff383f083bd615d5
Algorithm:                SHA256_RSA4096
Rollback Index:           0
Flags:                    0
Rollback Index Location:  0
Release String:           'avbtool 1.1.0'
Descriptors:
    Hash descriptor:
      Image Size:            19062784 bytes
      Hash Algorithm:        sha256
      Partition Name:        boot
      Salt:                  7495b86f34e2df2f28c894268ee8ae1533281c13990bb455588626e6f0b44e35
      Digest:                ab9c1ec5eb56f0ac8a9658ec71bcc46afe8165be27e8a2f66a2536ec06ec3693
      Flags:                 0
    Prop: com.android.build.boot.os_version -> '10'
```
### 6) Aşağıdaki komuttaki "xxxx" yazılı parametleri kaydettiğiniz çıktıya göre düzenleyin ve komutu çalıştırın.
### Komut hata vermeden çalışırsa imzalanmış imaj dosyanız hazır demektir.
```bash
python avbtool.py add_hash_footer \                                                                                                                 
--image xxxx.img \
--partition_name xxxx \
--partition_size xxxx \
--key custom_key.pem \
--algorithm SHA256_RSA4096 \
--salt xxxx
```
