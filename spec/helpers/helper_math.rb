# encoding: UTF-8

module HelpersMath

  def expect_not_subset(a, b)
    expect(a.⊂?(b)).to eq(false)
    expect(a.⊆?(b)).to eq(false)
    expect(a.⊄?(b)).to eq(true)
  end

  def expect_proper_subset(a, b)
    expect(a.⊂?(b)).to eq(true)
    expect(a.⊆?(b)).to eq(true)
    expect(b.⊃?(a)).to eq(true)
    expect(b.⊇?(a)).to eq(true)

    expect(b.⊂?(a)).to eq(false)

    expect(a.⊄?(b)).to eq(false)
    expect(b.⊄?(a)).to eq(true)
    expect(a.⊅?(b)).to eq(true)
    expect(b.⊅?(a)).to eq(false)
  end

  def expect_equal_sets(a, b)
    expect(a.⊂?(b)).to eq(false)
    expect(b.⊂?(a)).to eq(false)
    expect(a.⊃?(b)).to eq(false)
    expect(b.⊃?(a)).to eq(false)

    expect(a.⊆?(b)).to eq(true)
    expect(b.⊆?(a)).to eq(true)
    expect(b.⊇?(a)).to eq(true)
    expect(a.⊇?(b)).to eq(true)

    expect(a.⊄?(b)).to eq(true)
    expect(b.⊅?(a)).to eq(true)
    expect(b.⊄?(a)).to eq(true)
    expect(a.⊅?(b)).to eq(true)
  end

  def _compared_to_empty_set(set)
    expect(∅.⊂?(set)).to eq(false)
    expect(∅.⊆?(set)).to eq(set == ∅)
    expect(set.⊆?(set)).to eq(true)
  end

  def expect_number_set(obj, symbol, kclass, name)
    expect(obj).to eq(kclass.instance)
    expect(obj.ⓣ).to eq(kclass)
    expect(obj.🆔).to eq(kclass.instance.🆔)
    expect(obj.name).to eq(name)
    expect(obj.symbol).to eq(symbol)
    _compared_to_empty_set(obj)
  end

end