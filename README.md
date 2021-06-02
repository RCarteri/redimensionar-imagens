# Redimensionar imagens

Este programa escrito em Ruby transforma as imagens das pastas encontradas no mesmo local em imagens quadradas. Podendo escolher o tamanho da imagem final em pixels. Ex: 300x300.

## Como usar:

Para o correto funcionamento é necessário ter instalado o [Ruby][ruby], [Image Magick][image_magick] e uma [dependência][dependencia] do Windows.

Na mesma pasta do programa coloque as pastas contendo as imagens que deseja redimensionar. Após isso, execute o [resize_image][programa], escolha o tamanho que deseja que as imagens tenham e ele ajustará as imagens encontradas em todas as pastas colocando-as em uma pasta chamada "Redimensionadas". Como mostra o exemplo a seguir:

![gif][gif]

[programa]: resize_images.rb
[gif]: resize.gif
[dependencia]: https://aka.ms/vs/16/release/vc_redist.x64.exe
[image_magick]: https://imagemagick.org/download/binaries/ImageMagick-7.0.10-28-Q16-x64-static.exe
[ruby]: https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.1-1/rubyinstaller-devkit-2.7.1-1-x64.exe
