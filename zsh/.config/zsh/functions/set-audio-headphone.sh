#!/bin/bash

wpctl set-default $(wpctl status | grep "PRO X Wireless Gaming Headset Digital Stereo (IEC958)" | grep "\d+" -Po | head -n 1)
