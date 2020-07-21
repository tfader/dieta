class MealType < ApplicationRecord

  class << self
    def search_by_name(p_search)
      p_el = p_search.split(',')
      meal_type = nil
      if p_el.count > 0
        v_i = 0
        v_i.upto(p_el.count) do |i|
          meal_type = find_by(name: p_el[i])
          if meal_type.present?
            break
          end
        end
      end
      meal_type
    end
  end

end
