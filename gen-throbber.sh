#!/bin/bash


for i in {000..030}; do

x=$(echo "scale=2; ( $i / 30 ) * (300 - 60)" | bc -l)

echo "  GEN throbber-$i.png"

{
echo '<svg width="300" height="25" viewBox="0 0 300 25" fill="none" xmlns="http://www.w3.org/2000/svg">'
echo '<rect width="300" height="25" fill="black"/>'
echo '<rect width="300" height="5" rx="2.5" fill="#282828"/>'
printf '<rect x="%0.2f" width="60" height="5" rx="2.5" fill="#444"/></svg>' "$x"
} > throbber-$i.svg

rsvg-convert -o throbber-$i.png throbber-$i.svg
rm throbber-$i.svg
done

for i in {031..060}; do

x=$(echo "scale=2; (300 - 60 - ( ($i - 30) / 30 ) * (300 - 60))" | bc -l)

echo "  GEN throbber-$i.png"

{
echo '<svg width="300" height="25" viewBox="0 0 300 25" fill="none" xmlns="http://www.w3.org/2000/svg">'
echo '<rect width="300" height="25" fill="black"/>'
echo '<rect width="300" height="5" rx="2.5" fill="#282828"/>'
printf '<rect x="%0.2f" width="60" height="5" rx="2.5" fill="#444"/></svg>' "$x"
} > throbber-$i.svg

rsvg-convert -o throbber-$i.png throbber-$i.svg
rm throbber-$i.svg
done
