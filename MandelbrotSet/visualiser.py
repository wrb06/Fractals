from PIL import Image, ImageDraw

img = Image.new('RGB', (500, 500), color = "black")
d = ImageDraw.Draw(img)

f = open("test.txt", "r")
x = 0
y = 0
for line in f:
    for char in line:
        if char == "9":
            d.point([(x, y)], "white")
        x+=1;
    x=0
    y+=1
    if (y%100 == 0):
        print(y)


img.save('image.png')
