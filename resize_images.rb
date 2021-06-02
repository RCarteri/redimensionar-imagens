#Instalar
#https://imagemagick.org/download/binaries/ImageMagick-7.0.10-28-Q16-x64-static.exe
#https://aka.ms/vs/16/release/vc_redist.x64.exe
#https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.1-1/rubyinstaller-devkit-2.7.1-1-x64.exe

require 'pry'
require 'mini_magick'

class Resize_images
    def self.get_size
        puts "Gerador de imagens quadradas."
        puts "Digite o tamanho em pixels que deseja para as imagens (default: 300px):"
        @size = gets.chomp
        @size = '300' if @size == ""
    end

    def self.get_folders
        #variável onde irão as imagens redimensionadas
        @folder = 'Redimensionadas'
        #passando todos os arquivos da pasta para o array
        Dir.children "."
    end

    def self.resize_image images
        get_size
        images.each do |image|
            #abrindo imagem do array
            photo = MiniMagick::Image.open "#{image}" if File.file? image
            puts "\n Processando a imagem #{image}"
            
            photo.combine_options do |property|
                property.resize "#{@size}x#{@size}^"
                property.gravity "center"
                property.extent "#{@size}x#{@size}"
            end    
            #Entrando na diretório onde serão salvas as imagens
            diretory= Dir.pwd
            #Se já estiver no diretório não vai entrar de novo
            Dir.chdir "#{@folder}" unless diretory.include? "#{@folder}"
            #salvando imagem
            photo.write "#{image}"
            puts "#{image} Redimensionada com sucesso!"
            #Saindo do diretório
            Dir.chdir ".."
        end
    end

    def self.resize
        folders = get_folders
        folders.each do |folder|
            #Verificando se o arquivo é uma pasta
            if File.directory? folder
                #Entrar no diretório
                Dir.chdir "#{folder}"
                puts "\n #{"#"*50} \n Processando imagens da pasta #{folder} \n #{"#"*50}"
                #criando pasta se não existir
                Dir.mkdir @folder unless File.exists? @folder
                #Pegar todos os arquivos da pasta atual
                images = Dir.children('.').select{ |archive| File.file? archive }
                resize_image images
                #Voltando para processar outro diretório
                Dir.chdir ".."
            end
        end
    end
end

Resize_images.resize

