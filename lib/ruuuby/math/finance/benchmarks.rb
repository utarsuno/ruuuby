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
    #   ‣ `option`                         | "marketable security that gives the holder the right, but not the obligation, to buy or sell another security at a specific price by a certain date"
    #   ‣ `listed options`                 | `options` that trade on a national options exchange like the `Chicago Board Options Exchange (CBOE)`
    #   ‣ `LEAPs`                          | long-term `options`
    #   ‣ `FFO`                            | funds from operation
    #   ‣ `trailing stop`                  | "a stop loss that can increase with stock price rising but will not fall when stock price decreases" | (TODO: source from book Computational Investing pg. 2)
    #   ‣ `dark pool exchanges`            | trades that are matched internally but still documented to the whole world (in a market market, ex: brokerage)
    #   ‣ `discount rate`                  | TODO: for later (w/ variants)
    #   ‣ `crossing the spread`            | "bumping up your bid price to match ask"
    #   ‣ `market makers`                  | receivers of orders from brokerages TODO: better details
    #   ‣ `hedge funds`                    | able to rent tack space directly on exchange and monitor order books TODO: better details
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
    # ‣ | `Capital Asset Pricing Model (CAPM)` | describes relationship between `risk` and `expected return` (TODO: lots todo, just to provide an additional benchmark)
    # ‣ | `Sharpe Ratio`                       | "measure for calculating risk-adjusted return" | the higher the sharpe ratio the better | "when comparing two assets with each the same return, higher Sharpe ratio gives more return for the same risk" (TODO: source Computational Investing book)
    # ‣ | `Sortino Ratio`                      |
    # ‣ | `Jensen's Measure`                   | todo on quote "a risk-adjusted performance measure that represents the averager return on a portfolio over and above that predicated by the capital asset pricing model (CAPM), given the portfolio's beta and the average market return; this is the portfolio's alpha"
    #
    # ----------------------------------------------------------------------------------------------------------------------------------------------------------------
    # TODO: also source the original book these terms came from
    # @see http://www-cs-students.stanford.edu/~maisan/booknotes/randomwalk/chapter1.html
    #
    # ‣ | `firm-foundation theory`     | `intrinsic value` approach; given enough data and analysis, any stock's value can be determined  |
    # ‣ | `castle-in-the-air`         | investing off the overall crowd's trading meta |
    # ‣ | `new investment technology` | TODO: confirm/research this, "toward the end of the 20th century time spawned a new theory called the new investment technology" |
    #
    # ‣ | `random walk` | "a mathematical object, known as a stochastic or random process, that describes a path that consists of a succession of random steps on some mathematical space such as the integers" |
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
      # # TODO: handle ahead of time, generic algo to handle both stock splits and `deconglomeration`/`synergism` (ex: for both scenarios of market data and/or simulation 'bots')
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
