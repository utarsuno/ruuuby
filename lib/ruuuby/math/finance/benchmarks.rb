# encoding: UTF-8

module ::Math

  module Finance

    # ‣ | `personal consumption expenditures (PCE)` | tracked & reported by the `Bureau of Economic Analysis` | @see www.bea.gov |
    #
    # ‣ in general: inverse relationship between `interest rates` and `money supply`
    #   ‣ `➚ interest rates` : `money supply ↘`
    #   ‣ `↘ interest rates` : `money supply ➚`
    #
    # ‣ in general: inverse relationship between `bond values` and `stock market`
    #   ‣ `➚ bond values` : `stock market ↘`
    #   ‣ `↘ bond values` : `stock market ➚`
    #
    # common terms:
    #   ‣ `NASDAQ`                         | `National Association of Securities Dealers Automated Quotations`
    #   ‣ `NYSE`                           | `New York Stock Exchange`, also called: `the Big Board`
    #   ‣ `equity stocks vs preferred`     | `preferred stocks` are designed w/ focus on `dividend payments`
    #   ‣ `cyclical stocks vs defensive`   | `defensive stocks` perform relatively the same in all market conditions
    #   ‣ `net asset value (NAV)`          |
    #   ‣ `Exchange Traded Funds (ETF)`    | typically tracks specific `indexes`
    #   ‣ `Leveraged ETFs`                 | `ETFs` w/ added ``volatility by containing additional securities like `options` and `futures`
    #   ‣ `Inverse ETFs`                   | `ETFs` that bet against a part of the market
    #   ‣ `SPDRs`                          | created by `State Street Global Advisors`
    #   ‣ `Asset Allocation ETFs`          | relatively newer, broader `ETFs` that can hold more than `class of securities`
    #   ‣ `slippage`                       | when an order executes/fills w/ a slightly higher/lower price than reached for
    #   ‣ `book value`                     | literal sum of the parts
    #   ‣ `future-returns/intrinsic-value` | combined w/ `book value` equates a company's fundamental value
    #   ‣ `market-value/market-cap`        | `shares outstanding` * `share price`
    #
    # common equity brackets:
    #   ‣ `large cap` | $10+ billion
    #   ‣ `mid cap`   | $2 billion - $10 billion
    #   ‣ `small cap` | $300 million - $2 billion
    #   ‣ `micro cap` | < $300 million
    #
    # common pattern names:
    #  ‣ `consolidation`, `cup-with-a-handle`, `evening doji star`, `hanging man`, `pennant`, `wedge`
    #
    # common time frames:
    #  ‣ `short-term` | `1-2 weeks`
    #  ‣ `swing`      | `2-5 days`
    #  ‣ `scalping`   | `seconds to minutes`
    #
    # 5 common types of bonds:
    #   ‣ `U.S. government securities`
    #   ‣ `mortgaged-backed securities (MBS)`
    #   ‣ `municipal bonds`
    #   ‣ `corporate bonds`
    #   ‣ `junk bonds`
    #
    # ‣ `Treasury bills` | short-term securities, 4-weeks to a year
    # ‣ `Treasury notes` | intermediate maturities, usually between 2-5 years
    # ‣ `Treasury bonds` | `strictly long term (30+ years)`
    #
    # ‣ `fund families` | `large group of mutual funds hosed under a single company/entity`
    #
    # | `gross domestic product (GDP)` | consumption, investment, government purchases, net exports, etc                                                  | lagging indicator |
    # | `consumer price index (CPI)`   | a common/core set of goods & services whose retail-level prices that are tracked over specific time periods       |
    # | `consumer confidence`           | interview based data gathering overall consumer sentiment                                                        |
    # | `job growth`                   | an aggregate of various information such as: length of average workweek, hourly earnings, unemployment rate, etc |
    # | `unemployment index`           | subset of `job growth` data                                                                                      | lagging indicator |
    # | `housing starts`               | the number new construction projects for single-family home/buildings per month                                  |
    # | `business inventories`         | aggregate of various information such as: business inventories gathered from retail reports                      |
    # | `producer price index (PPI)`   | tracked prices of `raw materials`, `intermediate goods`, & `finished goods`                                       |
    # | `international bond trading`   |
    #
    # ‣ `LEI Index` | future economic activity predictor
    #   ‣ industries of different types will perform better/worse during the various economic cycle stages
    # ‣ `industry` | a specific set of businesses
    # ‣ `sector`   | broader area than `industry`
    #
    # ‣ in general, the economy cycles in four stages: `downturn`, `recession`, `upturn`, `recovery`
    #
    # ‣ | `Dow Jones Industrial Average (DJIA) or (DOW)` | comprised of 30 established blue-chip companies w/ each given equal weight                      |
    # ‣ | `Standard & Poor's (S&P)`                      | comprised of 500 stocks, given weight is distributed by stock market value                      | 400 industrial stocks, 20 transportation, 40 utility stocks, 40 financial stocks (most listed on `NYSE` and some are `over-the-counter (OTC) stocks`)
    # ‣ | `The Russell 2000`                             | comprised of small-cap equities market, those w/ market-cap between $300 million and $2 billion | a subset of the `Russell 3000 Index`
    # ‣ | `Value Line Index`                             | comprised of 1,700 equally weighted stocks across `NYSE`, `NASDAQ`                              |
    #
    # ----------------------------------------------------------------------------------------------------------------------------------------------------------------
    #
    # ‣ | `Capital Asset Pricing Model (CAPM)` | describes relationship between `risk` and `expected return`
    # ‣ | `Sharpe Ratio`                       |
    module Benchmarks

      # 4 common main ways of bench-marking time-series based algorithms:
      #  ‣ | `historical back testing` | results ONLY to be used for providing a comparison benchmark
      #  ‣ | `out-of-sample testing`   | reserve `10-20%` of overall data to be used for testing/benchmarking (note: separate to that of the learning & tuning/optimization data)
      #  ‣ | `walk-forward analysis`   | an aggregate of multiple runs of `out-of-sample testing`
      #  ‣ | `real-time analysis`      | compare to `walk-forward analysis` but emulate as many of the abnormalities/complexities of the real market as possible
      #
      # ‣ regardless of testing style, common fields to compare should be generated into an `API`-consumable summary/report
      #
      # ‣ | `Expectancy` | `((average $g00d)(win %) + (average $no-g00d)(lose %)) / (-average $no-g00d)`
      #
      # ----------------------------------------------------------------------------------------------------------------------------------------------------------------
      # broadly, separate to the reality that any particular statistical model/algorithm, there should be a natural weight/friction to the cost of any energy
      # as an example, for a time-series algorithm, it can be externally scored against such attributes:
      #
      #  ‣ `specific`
      #  ‣ `measurable`
      #  ‣ `attainable`
      #  ‣ `relevant`
      #  ‣ `time bound`
      #
      # # TODO: t distribution tests (determine if datasets are statistically different)
      #
      # ----------------------------------------------------------------------------------------------------------------------------------------------------------------
      #
      # TODO: temporary name, searching for math context
      module AlgoScoring

      end # end: {AlgoScoring}
    end # end: {Benchmarks}
  end
end

# TODO: https://www.bankrate.com/rates/interest-rates/libor.aspx
# TODO: https://www.bea.gov/

# TODO: https://www.thebalance.com/major-world-stock-market-indexes-4148491
# TODO: https://www.thebalance.com/major-market-indexes-list-2466397#:

# TODO: `preferred stocks`
# TODO: https://www.investopedia.com/terms/c/capm.asp
