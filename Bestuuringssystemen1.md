# Installatie Windows Server 2016

---

## Virtualbox Configuratie server instantie

Naam | Type | Versie | RAM | Harde Schijf
------ | ------ | ------ | ------ | ------
WindowsServer2016 | Windows | Windows 2016 (64-bit) | 1/4 Totaal = 4096 mb | 50GB Dynamisch alloceert

* !Indien er geen 64-bit aanwezig is = BIOS / UEFI Virtualisatie inschakelen

---

## Windows Server hardware Config

* 2 Netwerkadaptors: NAT en Host-Only
* Opslag: kiezen voor ISO

---

## Start Windows Server 2016

* Taal: English United States
* Dutch (Belgium)
* Belgium (Period)
* Ingeven Key
* Standard Desktop Experience = GUI niet alleen command line interface
* Custom Install
* Partities: 70GB
  * New: 70000mb
  
## Server Manager

* Local Server
* Aanpassen internetkaarten
  * Kabel uitdoen bij NAT
  * Kan hierdoor zien welke ethernet gelijk is aan welke internetkaart
  
    INCTConnectie | LANConnectie
    ------ | ------
    IP: DHCP | IPV4: 192.168.1.1
    SN: DHCP | SN: 255.255.255.0

  
---
## Snapshot

* Virtualbox: machine = take snapshot
