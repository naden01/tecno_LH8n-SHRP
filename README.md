# PBRP tree for TECNO LH8n (LH8n)

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (2x2.4 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)
Chipset | MediaTek Dimensity 6080 (MT6833)
GPU     | Mali-G57 MC2
Memory  | 4/8 GB RAM
Shipped Android Version | 13 (HIOS 13.5) ~ upgradable to hios 14 ~
Storage | 128/256 GB (UFS)
Battery | 5000 mAh, non-removable
Display | 1080 x 2460 pixels,6.78 inches, 60/90/120hz

![poba5pro](https://github.com/user-attachments/assets/0bfd51aa-7b85-4d65-afe7-602bfc4cb12e)

# Clone
    git clone https://github.com/naden01/tecno_LH8n-pbrp.git -b 14 device/tecno/LH8n

# Build
    export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch pb_LH8n-eng; mka vendorbootimage

