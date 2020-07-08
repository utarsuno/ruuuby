# encoding: UTF-8

# mathematics related code
module ::Math

  module Stats

    # relatively focuses more on obtaining `predictions` w/ highest accuracy possible
    module StatisticalLearning

      # actual vs. predicted (also called `Confusion Matrix`)
      #
      #  ___________________| actual = true       | actual = false      |
      # | predicted = true  | TP (true positive)  | FP (false positive) |
      # | predicted = false | FN (false negative) | TN (true negative)  |
      #
      # ACCURACY  = (TP + TN) / (TP + TN + FP + FN)
      #  note: don't over-use this benchmark, too easy to fall into 'everything looks good' model versus 'nothing looking fraudulent' model
      #
      # PRECISION = TP / (TP + FP)
      #  ex: "probability that a transaction branded 'fraudulent' is actually"
      #
      # RECALL    = TP / (TP + FN)
      #  ex: "probability that a truly fraudulent transaction is caught by the model"
      #

    end

  end

end
