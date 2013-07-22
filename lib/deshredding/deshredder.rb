#encoding utf-8
class Deshredder
  def analyse(in_file, out_file)
    source = SourceImage.new(in_file)
    destination = DestinationImage.new(source.columns, source.rows)

    (0..source.columns).each do |y|
      pixel = Pixel.new(0,y,source.pixel(0,y))

      best_score = [100000,pixel]

      ((y+1)..source.columns).each do |other_y|
        new_score = pixel.closeness_score(source.pixel(0,other_y))
        best_score = [new_score, pixel] if best_score.nil? || new_score < best_score[0]
      end

      (0..source.rows).each do |x|
        destination.pixel(x,y,best_score[1].pixel)
      end
    end

    destination.write(out_file)
  end
end
