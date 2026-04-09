Add-Type -AssemblyName System.Drawing
$img = new-object System.Drawing.Bitmap("c:\Users\lucas\Desktop\Hubs Digitais\Personal Traier\Charles Personal\image\logo-clara.jpeg")
$colors = @{}
for ($x=0; $x -lt $img.Width; $x+=5) {
    for ($y=0; $y -lt $img.Height; $y+=5) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -ne $c.G -or $c.G -ne $c.B) {
            if ($c.G -gt 80) {
                $hex = '#{0:x2}{1:x2}{2:x2}' -f $c.R, $c.G, $c.B
                $colors[$hex]++
            }
        }
    }
}
$colors.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 5
