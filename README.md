# VFIO-KVM-INTEL

## Introduction
**What is VFIO?**
When virtualizing an operating system like linux or windows, the main drawback is the lack of a proper graphics driver to bridge the gpu in your computer, to what the virtual machine guest can interact with. VFIO solves the problem by hijacking your graphics card, and reserving it for the virtual machine to take hold of, providing near native gpu performance.


**What is KVM?**
KVM is a hypervisor built into the linux kernel, similar to Oracle Virtualbox, or VMware. The difference being, the hypervisor being built into the linux kernel allows for higher performance, and better compatibility.

## What i do 
this is my scripts with my config.xml 
 * Passtrough of USB Controller and onboard Realtek and Graphic Card
 * Passtrough the entire SSD/HDD on the sata bus
 * Working with the feature flags to play with the anticheats without hyper-v (only tested with intel cpu)
 * Done the cpupinning with the interrupt masking and cpu shielding
 * Disabled the USB Controller virtual and memballon

## My PC
configuration of my pc
  * Intel® Core™ i5-10400F Processor 12M Cache, up to 4.30 GHz (5cores,10threads on the vm)
  * HyperX Fury 16GB 2666MHz DDR4 CL16 DIMM  Black XMP Desktop Memory Single Stick HX426C16FB3/16 (12gb on the vm)
  * Gelid Solutions Phantom CPU Cooler with 120 mm Case Fan (very good i don't reach the 65° of temp)
  * Sapphire Nitro+ RX 580 4GB 1411Mhz on Core Clock - 2100 on Memory Clock (doesn't need a rom to pass on the vm)
  * PNY CS900 250GB 3D NAND 2.5" SATA III Internal Solid State Drive (SSD) - (SSD7CS900-250-RB) 
  * Seagate Barracuda Pro Performance Internal Hard Drive SATA HDD 1TB 7200RPM 6Gb/s 128MB Cache 2.5-Inch (ST1000LM049) 
  * Gigabyte H410M S2H (LGA1200/ Intel/ H410/ Micro ATX/Ultra Durable/M.2/SATA 6Gb/s/8118 Gaming LAN/ DDR4/ HDMI 1.4/ DVI-D/Motherboard) 
  * Sharkoon Power Supply SHP 600W 80+ Bronze ATX Low Noise FAN 120MM 
  * Arch Linux with 5.13.13-zen1-1-zen (don't use for now the new kernel [issue](https://gitlab.freedesktop.org/drm/amd/-/issues/1718))

if you want to improve my configuration do a pull request and i will see thanks.