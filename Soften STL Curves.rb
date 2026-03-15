require 'sketchup.rb'

module MfpLab_StlCleanup
  def self.soften_curves
    model = Sketchup.active_model
    entities = model.active_entities
    selection = model.selection

    targets = selection.empty? ? entities.to_a : selection.to_a
    
    # 滑らかにする角度のしきい値（20度くらいが一般的です）
    angle_threshold = 20.degrees

    model.start_operation("Soften STL Curves", true)

    targets.each do |entity|
      next unless entity.is_a?(Sketchup::Edge)
      
      faces = entity.faces
      if faces.length == 2
        # 2つの面の法線ベクトルがなす角度を計算
        angle = faces[0].normal.angle_between(faces[1].normal)
        
        # 設定した角度以下の「緩やかな折れ曲がり」であればソフト化
        if angle > 0 && angle < angle_threshold
          entity.soft = true
          entity.smooth = true
        end
      end
    end

    model.commit_operation
    UI.messagebox("曲面のクリーンアップが完了しました。")
  end
end

# メニューに追加
if not file_loaded?("soften_stl_curves.rb")
  UI.menu("Tools").add_item("Soften STL Curves") {
    MfpLab_StlCleanup.soften_curves
  }
  file_loaded?("soften_stl_curves.rb")
end