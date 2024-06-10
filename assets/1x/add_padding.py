import sys
from PIL import Image, ImageOps

def add_padding(image_path):
    try:
        # Open an image file
        with Image.open(image_path) as img:
            # Ensure the image has an alpha channel for transparency
            if img.mode != 'RGBA':
                img = img.convert('RGBA')
            # Add 1px transparent padding to all sides
            padded_img = ImageOps.expand(img, border=1, fill=(0, 0, 0, 0))
            # Save the modified image
            new_path = image_path.replace(".", "_padded.")
            padded_img.save(new_path)
            print(f"Saved padded image as {new_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python add_padding.py <image_path>")
    else:
        image_path = sys.argv[1]
        add_padding(image_path)
