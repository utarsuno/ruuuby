# encoding: UTF-8

module ::Math

  # | term                   | details                                                              | source |
  # | ---------------------- | -------------------------------------------------------------------- | ------ |
  # | `volatility`           | the measure of `uncertainty` & `fluctuation`                          | `0x0`  |
  # | `financial derivatives` | a `security` deriving its value from some other underling `security` | `0x0`  |
  # | `P/E`                  | `price` to `earnings` ratio                                          |        |
  module Finance

    # @see https://en.wikipedia.org/wiki/List_of_circulating_currencies
    #
    # "relative values of currencies are generally expressed to four decimal places"
    #
    # ‣ | `tick` | the change in price that a `commodity` receives after a set of transaction(s) | ex: `EUR/USD` has `> 100 ticks per minute` during timings in the day w/ high liquidity |
    #
    # ‣ conditionally observable 'feature'/`dimension` (conditional as presence of comparable data allows for normalization and thus easier to extract meaning):
    #   ‣ in general: inverse relationship between `bid-ask spread` and `liquidity`
    #     ‣ `➚ liquidity` : `bid-ask spread ↘`︎
    #     ‣ `↘ liquidity` : `bid-ask spread ➚`︎
    #   ‣ in general: direct relationship between `liquidity` and `certainty`
    #     ‣ `➚ liquidity` : `certainty ➚`
    #     ‣ `↘ liquidity` : `liquidity ↘`
    #
    # ‣ in general: a relatively direct relationship between `P/E` and `expected growth rate`
    #   ‣ `➚ P/E` : `expected growth rate ➚`
    #   ‣ `↘ P/E` : `expected growth rate ↘`
    #
    # ‣ w/ `n` currencies there exists `n² - n` exchange rates
    #
    # ‣ helpful resources from `National Futures Association (NFA)`:
    # @see https://www.nfa.futures.org/investors/investor-resources/index.html
    #
    #module Forex
      #CRYPTO = {
      #    BTC: %w(Bitcoin ₿),
      #    LTC: %w(Litecoin Ł),
      #    DOGE: %w(Dogecoin),
      #    ETH: %w(Ethereum),
      #    MIOTA: %w(IOTA)
      #}
    #end

=begin
      module Fiat
        TEMP_DATA = {
            KWD: ['د.ك', 'Kuwaiti dinar', 'Kuwait', '🇧🇭'],
            BHD: [".د.ب", 'Bahraini dinar', 'Kuwait', '🇰🇼'],
            OMR: ["ر.ع.", 'Omani rial', 'Oman', '🇴🇲'],
            JOD: ["ر.ع.", 'Jordanian dinar', 'Palestine', '🇵🇸'],
            GBP: ["£", 'British pound', 'United Kingdom', '🇬🇧'],
            KYD: ['$', 'Cayman Islands dollar', 'Cayman Islands', '🇰🇾'],
            EUR: ['€', 'Euro', 'European Union', '🇪🇺'],
            CHF: ['Fr.', 'Swiss franc', 'Switzerland', '🇨🇭'],
            USD: ['$', 'United States dollar', 'United States', '🇺🇸'],
            CAD: ['$', 'Canadian dollar', 'Canada', '🇨🇦'],
            INR: ['₹', 'Indian rupee', 'India', '🇮🇳'],
            JPY: ['円', 'Japanese yen', 'Japan', '🇯🇵'],
            KRW: ['₩', 'South Korean won', 'Korea, South', '🇰🇷'],
            AUD: ['$', 'Australian dollar', 'Australia', '🇦🇺'],
            NZD: ['$', 'New Zealand dollar', 'Cook Islands', '🇨🇰'],
            RUB: ['₽', 'Russian ruble', 'Russia', '🇷🇺'],
            MXN: ['$', 'Mexican peso', 'Mexico', '🇲🇽'],
            CNY: ['元', 'Chinese yuan', 'China', '🇨🇳'],
        }
      end
=end

=begin
    # | term                   | details                                                                                                               | source |
    # | ---------------------- | --------------------------------------------------------------------------------------------------------------------- | ------ |
    # | `actuals`              | reference to `commodities`                                                                                            | |
    # | `insights`             | means the underlying `commodities` composing a futures contract will be physically delivered                          | |
    # | `break`                | refers to any natural occurrence which negatively impacts a futures contract such as a tornado or an unseasonal frost | |
    module Commodities
      TEMP_DATA = %w(gold silver oil printer-ink)
    end
=end

  end
end

#         __    __               __               __
#        /\ \__/\ \__         __/\ \             /\ \__  __
#    __  \ \ ,_\ \ ,_\  _ __ /\_\ \ \____  __  __\ \ ,_\/\_\    ___     ___     ____  __
#  /'__`\ \ \ \/\ \ \/ /\`'__\/\ \ \ '__`\/\ \/\ \\ \ \/\/\ \  / __`\ /' _ `\  /',__\/\_\
# /\ \L\.\_\ \ \_\ \ \_\ \ \/ \ \ \ \ \L\ \ \ \_\ \\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\/_/_
# \ \__/.\_\\ \__\\ \__\\ \_\  \ \_\ \_,__/\ \____/ \ \__\\ \_\ \____/\ \_\ \_\/\____/ /\_\
#  \/__/\/_/ \/__/ \/__/ \/_/   \/_/\/___/  \/___/   \/__/ \/_/\/___/  \/_/\/_/\/___/  \/_/
#
# | #    | source URL                                                                         |
# | ---- | ---------------------------------------------------------------------------------- |
# | 0x0  | https://commons.lib.jmu.edu/cgi/viewcontent.cgi?article=1303&context=honors201019  |
