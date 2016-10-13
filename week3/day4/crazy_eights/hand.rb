class Hand < Array

  def select_a_card(top_card)
    selected_index = index { |card| card.is_match?(top_card) }
    self.delete_at(selected_index) if selected_index
  end

  def suits
    collect do |card|
      card.suit
    end
  end
  
  def largest_suit
    suits.group_by{|a| a}.max_by{|word, value| value.length}[0]
  end

end
