require './lib/card'
require './lib/turn'
require './lib/deck'



class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, @deck.cards[0])
        @turns.push(new_turn) 
        @deck.cards.shift
        new_turn    
    end

    def number_correct
        correct_answers = 0
        @turns.each do |turn|
            if turn.correct? == true then correct_answers += 1
            end
        end
        correct_answers
    end

    def number_correct_by_category(category)
        category_correct = 0
        @turns.each do |turn|
            if turn.correct? == true && turn.card.category == category
                then category_correct += 1
            end
        end
        category_correct
    end

    def percent_correct
        (number_correct.to_f / @turns.length)*100
    end





end