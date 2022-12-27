def select_fruit(produce)
  selected_fruits = {}
  counter = 0

  loop do
    break if counter == produce.size

    current_key = produce.keys[counter]
    current_value = produce.values[counter]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
