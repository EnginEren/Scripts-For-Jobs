#!/bin/bash

#First argument is parameter name
#Second argument is parameter value
#Third argument is parameter uncertainty

#Copy base file which you fixed the parameters
#cp input_steering/minuit.in.txt.Edv.Eg.Dg.Duv minuit.in.txt
#cp input_steering/minuit.in.txt.Edv.Eg.Duv.NeG.DUbar.Ddv.EUbar minuit.in.txt
cp input_steering/minuit.in.txt.Dg.Bdv.EUbar minuit.in.txt

#Change selected parameter
awk '$2=="'"'$1'"'"{$3='$2'}1' minuit.in.txt > tmp && mv tmp minuit.in.txt
awk '$2=="'"'$1'"'"{$4='$3'}1' minuit.in.txt > tmp && mv tmp minuit.in.txt

#Uncomment migrad and hesse 
awk '$1=="call"{$1="*call"}1' minuit.in.txt > tmp && mv tmp minuit.in.txt
awk '$1=="*migrad"{$1="migrad"}1' minuit.in.txt > tmp && mv tmp minuit.in.txt
awk '$1=="*hesse"{$1="hesse"}1' minuit.in.txt > tmp && mv tmp minuit.in.txt

