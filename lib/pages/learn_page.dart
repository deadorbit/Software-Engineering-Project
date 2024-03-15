import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {

  String value = "";
  double $precent = 0.00;
  String $progress = "Incomplete";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
        child: Column(
          children: [
            LinearPercentIndicator(
              lineHeight: 40,
              percent: $precent,
              progressColor: Colors.green,
              backgroundColor: Colors.red,
              center: Text($progress),
            ),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: """

                        \nDefinition of spread
                        \nA spread corresponds to the difference between the best buy price (ask) and the best selling price (bid) offered on the asset order book. This is the price at which you can buy or sell an asset with a market order.The bid price (maximum price at which a seller is willing to sell the asset) is always higher than the ask price (maximum price at which a buyer is willing to buy the asset).

                        """,
                  child: Text("\nTrading for Dummies - Definition of Spread"),
                ),
                DropdownMenuItem<String>(
                  value: """ 

                        \nSpreads in practice
                        \nThe size of the spread is generally expressed in points, except in Forex where we speak in terms of pips.
                        \nLet us take the example of an asset whose bid/ask is as follows:98.30 / 98.35.
                        \n98.30 is the price at which you can sell the asset
                        \n98.35 is the price at which you can buy the asset
                        \nTo calculate the spread, simply subtract the bid price from the ask price. In this case, the spread is 0.05 point (98.35-98.30)
                        \nWhen you take a position on an asset, you therefore inevitably lose the spread amount. If we take our example again, the price must rise by 0.05 points for your transaction to be zero.You pay the full spread when you take a position.

                        """,
                  child: Text("\nTrading for Dummies - Spreads in practice"),
                ),
                DropdownMenuItem<String>(
                  value: """
                        
                        \nTwo factors enter into account in the development of a spread:
                        \nVolatility: The more volatile an asset is, the higher the spread.This is particularly the case during important economic announcements or periods of nervousness on the financial markets.On a volatile asset, the variations have a greater amplitude and are often erratic.
                        \nLiquidity: The more liquid an asset, the lower the spread.In fact, there are more buyers and sellers, which increases the number of transactions.With a liquid asset, transaction volumes are higher.
                        \nFor these reasons, not all assets have the same spread. An asset’s spread constantly changes depending on these two factors.

                        """,
                  child: Text("\nTrading for Dummies - What Influences Spread"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThere is a spread on all asset types.It enables certain brokers to remunerate themselves, notably on the Forex, commodities and derivatives markets. Indeed, on these markets, the broker can widen the spread on the products he offers to his clients.
                        \nIn Forex, banks are liquidity providers for all brokers.They allow brokers to have access to the interbank market (where transactions take place), governed by the law of supply and demand.
                        \nTo be remunerated, the forex broker will therefore widen the spread on each currency pair. Thus, if the EUR/USD quote 1.3001/1.3002 on the interbank market, the broker's clients will for example see the following quote on their trading platform:1.3000/1.3004.The difference between the price offered on the interbank market and on the trading platform is therefore up to the broker.That's his commission.He receives it on every transaction his clients make.
                        \nOn the financial markets, brokers do not use the spread to remunerate themselves but charge their clients transaction fees (usually in % of the traded volume).

                        """,
                  child: Text("\nTrading for Dummies - A Means of Remuneration"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThe Benefits of Long-Term Trading
                        \nThe majority of individuals who start trading prefer short-term trading. This comes from a common misconception that "to be a winner in trading, takes the whole day". Becoming a trader takes a lot of work and time to be able to learn how to trade properly, but it is not necessary to spend the day in front of the screen trading. The performance of a trading account is in no way related to the time spent looking at the trends of various assets. A new trader should not feel obliged to trade short term to be a successful trader. Long-term trading ranges from the daily chart to the monthly chart.

                        """,
                  child: Text("\nTrading for Dummies - TBLTT"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nA Psychological Advantage
                        \nTrading is like life, there's something for everyone. There are short, medium and long term traders. Long term trading should not be associated with an investment, as might be the case for investors who acquire shares to pocket the dividends. Investment and long-term trading are two completely different things. Moreover, not all traders are made for the short term. On the one hand, there is the time available in the day to deal (if you also have a job, it's hard to spend hours trading), and there is also traders’ ability to manage their emotions. 
                        \nPsychology in trading is a very important element, at the same level as trading strategy, if not more! New traders are often overwhelmed by their emotions when trading, and short term trading does not help. They feel overwhelmed by events, by the too rapid evolution of prices, by short-term volatility, etc. As a result, they give in to emotions and start making errors, making irrational decisions, no longer following their trading strategy, no longer respecting their money management rules, etc.

                        """,
                  child: Text("\nTrading for Dummies - APA - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nA Psychological Advantage
                        \nLong term trading makes it easier for traders to manage their emotions. You can't deny it, looking at trends for hours can send you crazy, it's sometimes difficult to manage for a seasoned trader let alone a novice trader. Similarly, taking a step back clears the mind and allows for better analysis. 
                        \nFor the most experienced traders, having the nose to the grindstone all the time sometimes leads to small mistakes. For a novice trader, having the nose to the grindstone often ends up by the abusive use of leverage. It takes a certain amount of time to get our brain accustomed to ignoring the lure of profit, to no longer think money but performance (percentage of gain). Likewise, one must get used to accepting a loss without flinching. If you don't know how to get past your ego, trading is not for you. In trading, you remain a beginner all your life and losing trades are part of everyday life!
                        
                        """,
                  child: Text("\nTrading for Dummies - APA - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThe Benefits of Long Term Trading
                        \nTime to analyse: Long term trading gives traders much more time to analyse various assets’ charts. Traders then have time to properly determine their entry point, stop loss level and price objectives. For a seasoned trader, doing an analysis is fast but for a beginner, it can take tens of minutes. Quality is better than quantity for analyses.
                        \nAvoid short-term volatility: Short-term movements are sometimes erratic and difficult for the uninitiated to understand. This short-term volatility is due to the high frequency trading practised by institutional investors. Whether in terms of price targets or stop losses, volatility makes trading more complicated.
                        \nTrend Trading: Long-term trading makes it possible to deal with the global trend of assets. In the short term, this is a common mistake made by beginners who analyse a chart but forget to analyse the upper time unit to determine the trend and potential resistance/support levels.

                        """,
                  child: Text("\nTrading for Dummies - OALTT - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThe Benefits of Long Term Trading
                        \nAvailable time: Long term trading enables traders to spend a short time trading. At first, carrying out an analysis may seem long, but with time, it quickly becomes fast. Traders do not have to do anything except determine their entry point and stop loss levels. They can then spend just a few minutes a day properly applying their trading method. Long term trading therefore leaves a lot of free time and allows you to have a job alongside. Traders just need to watch their trades from time to time to move stop losses or take profits if necessary. In the event of an unfavourable price change, a stop loss is there to protect you.
                        \nReduced stress: By practising long-term trading, traders suffer much less stress. It's easier to break away from trading, let their positions carry and just do a quick check from time to time. With short-term trading, that's another story. Beginner traders tend to stick to the screen to watch for any movement in the pair. This can be considered a mistake. It generates a lot of stress and often pushes traders to making irrational decisions (a little correction in the wrong direction, they cut; a little rally in their direction, they cut to preserve profits, etc.).
                        
                        """,
                  child: Text("\nTrading for Dummies - OALTT - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThe Benefits of Long Term Trading
                        \nFewer false signals: Chart patterns (and other technical elements) are often more relevant over the long term. There are fewer false signals and the movements are often more straightforward. 

                        """,
                  child: Text("\nTrading for Dummies - OALTT - Part 3"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nLong term trading offers many advantages that novice traders forget. However, it is often more suited to the profile of certain traders. Long-term trading requires less experience, facilitates the psychological management of trades and is more appropriate for good training. Trading is not necessarily a time-consuming activity, you just have to accept doing long-term trades.

                        """,
                  child: Text("\nTrading for Dummies - Conclusion "),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nBecoming a trader can't be improvised. It takes a lot of time, hard work and money to lose. The cycle to becoming a winner in your trading takes several years. Winning on one or more trades is something everyone can do, but winning in the long run is the real challenge. A series of winning trades does not make a good trader, and even less so with exceptional trading performance over a very short period. Many novice traders have trouble understanding what distinguishes a real trader from a simple Sunday punter. There are three pillars to being a winner in trading, to being a real trader.

                        """,
                  child: Text("\nTrading for Dummies - The Three Pillars of Trading Successfully"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 1: Trading Strategy
                        \nA trading strategy is what defines your position entry and exit criteria. It is the easiest pillar to acquire for a novice trader. For this, you have to learn the basics of technical analysis: chart patterns, resistances and supports, the main Japanese candlesticks and to know how to use the most well-known technical indicators. To learn this, there is no need to pay for training, there is free content on the web, such as the CentralCharts technical analysis guide for example. :)
                        \nAll these elements will allow you to build a trading strategy. A trading strategy should remain simple. There is no point in using 3 or 4 technical indicators or looking for the miracle indicator (which does not exist). If there is an essential basis in technical analysis, it is chart patterns and the ability to draw resistances and supports. These two elements are enough to build a simple trading strategy. The other elements (Japanese candlesticks and technical indicators) are more complementary to your strategy, they are generally used to optimize your strategy (using divergences on indicators, analysing candlesticks, etc.).

                        """,
                  child: Text("\nTrading for Dummies - Pillar 1: TS - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 1: Trading Strategy
                        \nTo progress, there is only one solution, practice the technical analyses. Doing is the best training, the way that we learn. To help you, you can look at the analyses of more experienced traders. But never follow other traders' analysis if you don't know the basics of technical analysis yourself. Through training, you will develop your trading strategy. In the end, it may be based on a particular indicator (Ichimoku, RSI, etc.), on Japanese candlesticks or on chart patterns. You should do it according to your own preferences, use the TA tools with which you feel most comfortable. There are thousands of winning strategies. A trading strategy is not the most important element to succeed in trading, far from it! Having a trading strategy does not make you a good trader, but a trader on the right path to success.
                        \nAh! I forgot perhaps the most important point, all this part of learning trading must be done on a demo account. It's absolutely no use (except losing your money) to start on a real account while you don't have at least one trading strategy. That's the strict minimum.

                        """,
                  child: Text("\nTrading for Dummies - Pillar 1: TS - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 2: Money Management
                        \nMoney management is risk management but also earnings management. In my view, this is the most important element. I did a twitter survey on the subject and I was pleasantly surprised to see that money management is considered, by you, to be the most important criteria to succeed in trading:
                        \nThis is often what makes the difference between a losing trader and a winning trader. Risk management is the management of your stop loss but also the management of your capital. Knowing how to place a stop loss is one thing, but if you risk too much of your capital, it doesn't make much sense. Whenever possible, you should never exceed 2% risk on a trade, even 1% for novice traders. This is why the amount that you deposit on an account should not be too small, it should allow you to apply strict risk management. Depending on the assets you trade, this amount varies enormously. For example, processing indices is very expensive, while Forex allows you to further adjust your position sizes (with mini lots).

                        """,
                  child: Text("\nTrading for Dummies - Pillar 2: MM - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 2: Money Management
                        \nTo learn the basics of money management, use a demo account. Make a few trades scrupulously following your previously established trading strategy. For each type of asset traded, you need to familiarise yourself with the position sizes, understand the influence this has on your account in case of a losing trade. Then try to advance your trading account over a few weeks (still on demo). This will teach you how to optimize the placement of your stop loss at the opening of a trade but also during the trade. Because yes, a stop loss moves as you trade (especially if you swing trade) to first reduce your risk and then protect your gains. It sounds easy to say but it's a very complicated step. This is one of the hardest elements in trading. Moving your stop too quickly will cause you to lose a very large number of trades, and moving it too late (or not moving it at all) can generate heavy losses which are difficult to recuperate. To have good performance when you start with a -2% trade on the account, you have to struggle afterwards to finish in a positive position. 
                        \nOnce you are able to grow your demo trading account in a sustainable way (at least over a few weeks), you can finally open a real account.

                        """,
                  child: Text("\nTrading for Dummies - Pillar 2: MM - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 3: Psychology
                        \nThis component is very difficult to tame for the simple reason that it cannot be learned. Psychology in trading is managing your emotions. These emotions depend on your personality and especially on your relationship with money. On a demo account, you may feel some emotions but they are usually not very high. It is risking your money that will exacerbate them. For that, there is only one solution, the real account, the baptism of fire! You may have done all the necessary preparation, but you will never be ready for real trading. It is impossible to know how you will react with your money at stake. Money gives rise to many emotions: greed, fear, frustration, anger, denial and so on.

                        """,
                  child: Text("\nTrading for Dummies - Pillar 3: Psych - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 3: Psychology
                        \nTrading is one of the most effective ways to get to know yourself. It reveals your true nature, your biggest flaws. Strict money management is your best weapon to protect yourself against your emotions. Despite everything, at first, they often take over. Emotions are indeed devastating for both a losing trader and a winning trader. After a series of winning trades, you feel your wings grow, you tell yourself you are the strongest and you lower your guard. Excess confidence is a fearsome factor in trading. It can make you forget your trading strategy (to do more trades and earn even more) or risk management (by increasing position sizes, again to earn more). On the other hand, after a series of losing trades, you lose your means, you get angry, you curse yourself for having lost your hard earned money. Your emotions will then make you take more risk in order to make up for your loss.
  
                        """,
                  child: Text("\nTrading for Dummies - Pillar 3: Psych - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 3: Psychology
                        \nWhether you are winning or losing, from the moment you increase your risk, it is already too late! You will end up razing your trading account sooner or later. It is very difficult to become rigorous again and to apply a strict money management after having increased your risk (even if you tell yourself that it is temporary). Despite all the warnings I can give you, you will sooner or later go through this step. That's the price of training. I don't know a trader who hasn't razed a trading account. When this happens to you, do not, on any account, replenish your trading account. Move on to other things for several weeks. It takes time to digest the fact that you just threw your money out of the window. If you trade again too quickly, your emotions will still be too high and you will make the same mistake. Unfortunately, this is what far too many beginner traders do. Yet that's what it all comes down to. Come back rested, only time makes us learn from our mistakes.

                        """,
                  child: Text("\nTrading for Dummies - Pillar 3: Psych - Part 3"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPillar 3: Psychology
                        \nA few weeks later, you can put money back into your account. But be careful, it's very dangerous to invest more than 10% of your savings. To invest more, you must already be sure that you can earn over the medium/long term. In trading, your goal should not be to win but to last. If you last, you'll end up being a good trader.

                        """,
                  child: Text("\nTrading for Dummies - Pillar 3: Psych - Part 4"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThe temporality of a financial investment corresponds to the investment horizon. It can be short, medium or long term. Temporality is a function of your performance objectives and your investor profile. Each temporality has advantages and disadvantages.

                        """,
                  child: Text("\nTrading for Dummies - Definition of Temporality"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nA short-term investment is between one hour and one week. We are not talking about investment but trading. Below one hour, we talk about very short term trading which includes scalping and also some day trading positions. If you use technical analysis you will view charts ranging from 15 minutes to 4 hours.
                        \nShort-term advantage:
                        \n - Ability to get performance quickly
                        \nShort term disadvantages:
                        \n - Time consuming: short term trading requires regular trade monitoring (stop loss modification, trend reversal, etc.)
                        \n - Significant transaction costs: A short-term trader places a large number of orders and pays the spread and/or commissions for each round trip. This has a negative impact on performance.
                        \n - More stress: Watching the price charts creates stress.

                        """,
                  child: Text("\nTrading for Dummies - Trading: Short term"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nA medium term placement is between one week and several months. We can then call it an investment. You can then integrate the notion of fundamental analysis as a complement to technical analysis. If you use technical analysis, you will view daily charts.
                        \nMedium-term advantages:
                        \n - Suitable for a wider range of individuals
                        \n - Performance determined by the trend of assets in the portfolio
                        \n - Reduced stress

                        """,
                  child: Text("\nTrading for Dummies - Trading: Medium Term"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nA long-term investment is between one year and several years. In this case, the rules of portfolio management apply. If you use technical analysis, you will view weekly or monthly charts.
                        \nLong-term advantages:
                        \n - No stress
                        \n - Requires very little time: No need to regularly monitor changes in positions
                        \n - Very low transaction costs: There is no frequent round trip and you only pay the spread and/or commissions once.
                        \n - High earning potential: the longer the investment horizon, the greater the earning potential.
                        \n - Ability to invest large amounts with reduced risk (with good diversification)
                        \n - Suitable for all investor profiles
                        \n - Possibility of having your portfolio managed (UCITS) 

                        """,
                  child: Text("\nTrading for Dummies - Trading: Long Term - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nLong term disadvantages:
                        \n - Necessity of not needing your savings for the duration of the investment
                        \n - Requires in-depth analysis: technical analysis is insufficient, fundamental analysis is also required
                        \n - Can have a significant negative impact on your assets in the event of poor investment timing.

                        """,
                  child: Text("\nTrading for Dummies - Trading: Long Term - Part 2"),
                ),
              ],
              onChanged: (_value) => {
                print(_value.toString()),
                setState(() {
                  value = _value.toString();
                })
              },
              hint: const Text("Select Trading Chapter"),
            ),
            Text(
              value,
            ),
            ElevatedButton.icon(
              onPressed: () => {
                if ($precent == 1.0){
                  setState(() {
                    value = "";
                  }),
                } else {
                  setState(() {
                    $precent += 0.04;
                    value = "";
                    if ($precent >= 1.0){
                      $precent = 1.0;
                      $progress = "Completed!!!";
                    }
                  }),
                }
              }, 
              icon: const Icon(Icons.bookmark), 
              label: const Text("All Done"),
            ),
          ]
        )
      ),
    );  
  }
}
