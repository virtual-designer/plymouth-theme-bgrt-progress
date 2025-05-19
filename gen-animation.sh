#!/bin/bash


for i in {000..100}; do

wd=$(echo "scale=2; ($i / 100) * 300" | bc -l)

echo "  GEN animation-$i.png"
echo '<svg width="300" height="25" viewBox="0 0 300 25" fill="none" xmlns="http://www.w3.org/2000/svg">' > animation-$i.svg
echo '<rect width="300" height="25" fill="black"/>' >> animation-$i.svg
echo '<rect width="300" height="5" rx="2.5" fill="#282828"/>' >> animation-$i.svg
printf "<rect width=\"%0.2f\" height=\"5\" rx=\"2.5\" fill=\"white\"/></svg>\n" "$wd" >> animation-$i.svg

rsvg-convert -o animation-$i.png animation-$i.svg
rm animation-$i.svg
done
