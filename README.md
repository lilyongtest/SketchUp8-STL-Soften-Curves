# SketchUp 8 STL Soften Curves Plugin

This is a Ruby plugin for **SketchUp 8** designed to improve the appearance and usability of curved surfaces in imported STL meshes.

## Overview

Imported STL files often represent curves as a series of flat, jagged faces with visible edges. This makes cylinders, spheres, and holes look faceted and difficult to work with.

This plugin calculates the angle between adjacent faces. If the angle is within a certain threshold (20 degrees by default), it automatically applies **Soft** and **Smooth** properties to the edge. This results in a visually smooth surface and allows SketchUp to treat the faceted area as a single curved face.

## Key Features

* **Smart Smoothing**: Automatically identifies edges that belong to a curve rather than a sharp corner.
* **Improved Visuals**: Eliminates the "faceted" look of low-poly STL imports.
* **Better Editability**: Softened edges allow for easier selection and cleaner geometry management.
* **SketchUp 8 Compatible**: Lightweight script optimized for the Ruby 1.8 environment.

## Installation

1.  Download `soften_stl_curves.rb`.
2.  Copy the file into your SketchUp 8 `Plugins` folder:
    * **Windows**: `C:\Program Files (x86)\Google\Google SketchUp 8\Plugins`
    * **Mac**: `/Library/Application Support/Google SketchUp 8/SketchUp/Plugins`
3.  Restart SketchUp.

## How to Use

1.  Import your STL file.
2.  Select the specific curved geometry you want to smooth (or leave everything unselected to process the entire model).
3.  Go to the top menu: **Tools** > **Soften STL Curves**.
4.  The faceted edges will disappear, replaced by a smooth, shaded surface.

## License

This project is open-source. Feel free to use, modify, and distribute it.

---
Developed by **Mrs. Fancy Pants Lab**
