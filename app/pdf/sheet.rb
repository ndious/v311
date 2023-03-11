class Sheet
  def initialize(codes, qrcodes)
    @codes = codes
    @qrcodes = qrcodes
    @size = 80
    @marge = 15
    @marged_size = @size + @marge
  end

  def init_doc
    @pdf = Prawn::Document.new
    @pdf.font_families.update(
      'roboto' => {
        bold: 'app/assets/fonts/roboto/static/RobotoMono-Bold.ttf',
        italic: 'app/assets/fonts/roboto/static/RobotoMono-Italic.ttf',
        bold_italic: 'app/assets/fonts/roboto/static/RobotoMono-BoldItalic.ttf',
        normal: 'app/assets/fonts/roboto/static/RobotoMono-Regular.ttf'
      }
    )
    @pdf.font('roboto')
  end

  def current_positon
    x = (@index % 6 * @marged_size) - 10
    y = (@pdf.cursor - (@index / 6 * (@marged_size + 15))) + 26

    [x, y]
  end

  def get_png(qrcode)
    path = "/tmp/#{@index}-gen-qrcode.png"
    png = qrcode.as_png(
      # color: 'white',
      # fill: 'black',
      border_modules: 2
    )
    IO.binwrite(path, png.to_s)

    path
  end

  def draw_qrcode(path)
    x, y = current_positon
    @pdf.fill_rounded_rectangle [x, y], @size, @size + 15, 10
    @pdf.image path, at: [x + 5, y - 5], width: 70
    @pdf.fill_color 'FFFFFF'
    @pdf.draw_text "# #{@codes[@index]} #", at: [x + 10, y - 85], size: 10, style: :bold
    @pdf.fill_color '000000'
  end

  def print
    init_doc

    @qrcodes.each_with_index do |qrcode, index|
      @index = index
      path = get_png qrcode

      draw_qrcode path
    end
    @pdf.render
  end
end
