from PIL import Image
img_rgb = Image.open('something.png')
img_gray = img_rgb.convert('L')
img_gray.save('gray_image.jpg')