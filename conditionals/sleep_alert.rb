status = ['awake', 'tired'].sample
orders = if status =='awake'
          "Be productive!"
         else
          "Go to sleep"
          end
puts orders
