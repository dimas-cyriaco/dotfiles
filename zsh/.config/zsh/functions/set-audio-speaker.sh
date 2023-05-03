#!/bin/bash

wpctl set-default $(wpctl status | grep "Starship/Matisse HD Audio Controller Analog Stereo" | grep "\d+" -Po | head -n 1)
