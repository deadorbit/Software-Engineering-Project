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
                DropdownMenuItem<String>(
                  value: """

                        \nTrading Support and Resistance
                        \nIn trading, support and resistance breaks give you bullish or bearish signals. They allow you to open a position on a financial asset. Support and resistance breaks are used in most trading strategies based on technical analysis. There are rules for entering a position that winning traders follow. We will also look at how to optimize your entry points and how to avoid false signals on a break. And we will look at how to identify false support and resistance breaks. Finally, we will address risk management through placing stop losses.

                        """,
                  child: Text("\nTrading for Dummies - TSRP"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nSupport and Resistance Definition
                        \nBefore starting to answer all these questions, it is worth giving you a short reminder about resistances and supports. Resistances/supports do not consist of single points (high/low points) but of at least 3 points of contact with the price. However, supports/resistances can be drawn from only 2 contact points, the 3rd being used to validate the level.
                        \nSupports/resistances are not just horizontal lines formed by high/low points. These lines can be ascending or descending depending on the corresponding chart pattern (channel, triangle, flag, double bottom, head and shoulders, etc.). In a bullish channel, for example, the support/resistance lines are ascending. You then have to interpret the break differently according to the associated chart pattern. I advise you to consult our training sheets on the various chart patterns (how to trade them) to learn more.
                        \nA support break gives a bearish signal and a resistance break gives a bullish signal. In theory, once the signal is given, the price moves to the next support/resistance allowing you to make a profit on your trade.


                        """,
                  child: Text("\nTrading for Dummies - SRD "),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nOpening a Position on a Support / Resistance Break
                        \nSupport/resistance breaks happen all the time on the financial markets. It is easy to find bullish / bearish opportunities using breaks. These opportunities are multiplied by the fact that they can happen on all units of time.
                        \nOpening a position on a support/resistance break can be carried out in two ways:
                        \nAt the break: In theory, a support/resistance break is validated when the price closes below/above the level. However, the break must be clean and made on a long full candlestick (or with a long body) which marks an increase in the volumes (due to triggering numerous buy/sell stops). Here is an example of a clean support break: 
                        \nWhen is the position opened?
                        \n- When the candlestick is closed: this prevents as many false breaks as possible. Sometimes the price tests a support/resistance on a long wick and then finally closes above/below the level. This is particularly the case during periods of high volatility (economic announcements).

                        """,
                  child: Text("\nTrading for Dummies - OPS/RB - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nOpening a Position on a Support / Resistance Break
                        \nOn a stop order: Before the support/resistance breaks, it is possible to place a stop order (for sale in this case) but at a level lower than the support. If you place your stop just below/above the level, a simple wick will get you into position. In our example, your order would be validated at the point of the purple circle. You would then have returned too early and probably lost out on the trade given the rebound that took place afterwards.
                        \nAdvantages and disadvantages of opening a position on a break:
                        \nThe great advantage of this technique is that it means that you don’t miss the start of a movement. This is often the case with large trend movements. There are a lot of trading opportunities. On the other hand, your entry point is not optimized (a first wave has already taken place) and the stop loss placement is more complicated to manage.
                        """,
                  child: Text("\nTrading for Dummies - OPS/RB - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nOpening a Position on a Support / Resistance Break
                        \nOn the pullback: This is a technical event respective to a return on the support/resistance line that has just been broken. The pullback often continues beyond the recently broken level. Thereafter, the price will resume its initial movement and move to the next support/resistance.
                        \nWhen is the position opened?
                        \nIn this case, the position is only opened when the price starts to move in the direction of the break again. Here again you have to wait for the candlestick to close before opening a position. The simple fact that the price makes a pullback does not necessarily mean that the price will resume its initial movement. The corrective movement can indeed be prolonged much higher/lower.
                        \nIf the pullback continues beyond the support/resistance, it is the return above/below the support/resistance level that gives the bullish / bearish signal and allows you to open a position.
                        \nIf the pullback stops at the support/resistance level, you have to wait for the price to plunge/rebound before opening a position.

                        """,
                  child: Text("\nTrading for Dummies - OPS/RB - Part 3"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nOpening a Position on a Support / Resistance Break
                        \nAdvantages and disadvantages of opening a position on pullback
                        \nThe great advantage of this technique is that it allows you to optimize your entry point (the entry level is better than on the method with breakage). Moreover, the stop is easier to place and is done above/below the last high/low that has just been formed. However, you will miss a significant number of movements. In fact, pullbacks do not always intervene or they can intervene several days later (which can call into question the signal on the pullback, the movement having already taken place).

                        """,
                  child: Text("\nTrading for Dummies - OPS/RB - Part 4"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to optimize your entry point on a support/resistance break
                        \nWe have seen it, the first solution to optimize your entry point is to wait for a pullback on the recently broken support/resistance but it is not the only solution:
                        \nOpen two positions
                        \nTo optimize your entry point, you can take a first position directly at the break, then another if the pullback intervenes (at a better price). Thus, your entry price is better since it is calculated on the average of your 2 trades.
                        \nWarning, if you use this technique, you must reduce the size of your positions (divide them by 2). Your risk must not be higher than a classic trade.

                        """,
                  child: Text("\nTrading for Dummies - OPEPS/RB - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to optimize your entry point on a support/resistance break
                        \nOpen a position on an inferior time unit
                        \nTo refine your entry points, you can perform an analysis on the time unit lower than that of your trade. As the resistance/support level is the same on the lower time unit, it is possible for you to get the validation of a break or a reversal on a pullback more quickly. Your entry price is therefore optimized.
                        \nWarning, this technique increases the number of false signals. It is indeed possible for you to get the signal validation on the lower time unit, but it doesn’t happen on your trade’s time unit (low wick or high wick on the candlestick).

                        """,
                  child: Text("\nTrading for Dummies - OPEPS/RB - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to avoid false signals on support and resistance breaks
                        \nFalse breaks are part of trading. You can't escape them, but you can, however, reduce the number of false signals. Here is a list to help minimize false signals on support and resistance breaks: 
                        \nTake the wicks into account When drawing a support or resistance, connect the different high/low points taking into account the high/low wicks on the Japanese candlesticks. This is the best way to limit false signals.
                        \nWait for two consecutive candlesticks Once the level is broken, you can wait for a second consecutive candlestick to close above/below the level. This is a good way to limit false signals but has a negative impact on the performance of your trade (the entry price is often at a higher/lower price than on a classic trade).
                        
                        """,
                  child: Text("\nTrading for Dummies - AFSS/RB - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to avoid false signals on support and resistance breaks
                        \nDo not take into account signals in periods of high volatility Periods of high volatility will multiply false signals. You will often notice a lot of wicks forming on candlesticks (which can trigger your buy/sell stop) during significant economic announcements. Also, even if the signal is validated (the candlestick closes), volatility can hit your stop loss even if your scenario is eventually achieved.
                        \nMonitor volumes Because a lot of stops are triggered, a resistance or support break must normally happen with large volumes. If you find that there is no increase in volume, the probability of a false signal is higher.
                        \nWatch for discrepancies If you notice that discrepancies are forming with the indicators, despite the break in the support/resistance, the risk of market correction is significant. The larger the unit of time, the more the variation is a strong signal of reversal.
                        
                        """,
                  child: Text("\nTrading for Dummies - AFSS/RB - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to avoid false signals on support and resistance breaks
                        \nOpening positions on clean breaks The farther the break candlestick closes from the support/resistance level, the stronger the signal. On the other hand, your entry price will not be good and placing the stop will be complicated. It is better to wait for a pullback in these cases unless you notice that the bullish/bearish potential is very high.

                        """,
                  child: Text("\nTrading for Dummies - AFSS/RB - Part 3"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to identify false support and resistance breaks
                        \nEven by eliminating a large number of false signals, there are still false breaks. In this case, you have to know how to cut your trade, take your loss, and accept that you will have regrets (if the movement finally goes in the right direction) rather than wanting to be absolutely right by keeping your trade. This helps to limit losses on false breaks. Here are several ways to identify a false break:
                        \nWatch the next candlestick close Once the break has been validated, watch the next candlestick close. If it is above/below the recently broken level, the signal is invalid and you must cut your loss position.

                        """,
                  child: Text("\nTrading for Dummies - IFS/RB - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to identify false support and resistance breaks
                        \nLook at the colour of the next candlestick A break in the level of a support/resistance should normally cause a bearish/bullish wave. Several bearish/bullish candlesticks must therefore follow one another (even if the movement does not continue for a long time because of a pullback or trend reversal). If the candlestick following the break is the opposite colour to the break candlestick (bearish or bullish), it is often a sign of investor hesitation and a false signal.
                        \nLong wick at the break A break candlestick can have a long body and also a long high/low wick. This reflects the difficulty for buyers/sellers to take control. This is often a sign that the battle will be tough and that a false signal can happen. The following candlesticks should then be looked at carefully to see if the movement continues or not. In the case of a quick return above/below the break level (enclosed candlestick), it is better to cut your position.

                        """,
                  child: Text("\nTrading for Dummies - IFS/RB - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow to identify false support and resistance breaks
                        \nBreaks on small candlesticks Some levels are broken but on candlesticks with a short body (which usually translates to low volumes). This is very often a sign of a false break. In this case, even waiting for two enclosed candlesticks may not be enough to avoid the false bullish/ bearish signal trap.

                        """,
                  child: Text("\nTrading for Dummies - IFS/RB - Part 3"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPlacing a stop on supports/resistance breaks
                        \nIn trading, you have to consider the gains but above all think about the potential losses. You must place a stop loss protection on all your trades. You may cut your trade prematurely (manually) but you should never move your stop to prevent it from being reached. With break trading, the placement of the stop is essential and can have a significant impact on your account’s performance. Effectively, with a misplaced stop, a winning trade can turn into a losing trade. Here are several aspects to help you place your stop:
                        
                        """,
                  child: Text("\nTrading for Dummies - PSS/RB - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPlacing a stop on supports/resistance breaks
                        \nPlace your stop according to a market level A stop must never be determined by your entrance price. As a reminder, a stop corresponds to the level at which you estimate that your scenario will not be achieved. To start with I advise you to place it above the last highest/lowest or above the resistance/support level but with a good margin. If you see that the movement continues, you can then move it gradually as the new highest/lowest is being created. If the movement does not continue (false break, market reversal), you can manually cut your position before your stop is reached. On the other hand, if you see that the price seems to move towards a pullback after a bearish/bullish movement which follows the support/resistance break, leave your stop and do not cut your trade (even if the pullback continues beyond the level)
                        \nWarning!!: Depending on how far your stop loss is from your entry price, you need to adjust the size of your position. The further away your stop is, the smaller your position should be.

                        """,
                  child: Text("\nTrading for Dummies - PSS/RB - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPlacing a stop on supports/resistance breaks
                        \nLet your trade breathe Before placing a stop, do not rush. It is usually better to waituntil you have confirmation that the movement has started again in your direction and that the correction is complete. Otherwise, you risk seeing your stop loss reached too often, which will limit your gains and transform normally winning trades into losing trades.
                        \nReduce your trading risk incrementally If a strong movement has occurred in your direction, a correction should not normally follow the entire movement. You can then move your stop to your entry price level to totally eliminate your risk on the trade, or even move it to ensure you a minimum gain even in the event of market reversal.

                        """,
                  child: Text("\nTrading for Dummies - PSS/RB - Part 3"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTrading resistance and support breaks may seem simple in theory but in practice, you have to avoid a lot of traps and, especially, know how to identify false signals. There are many techniques to avoid false breaks, but despite everything, you can't escape them. You have to integrate it into your trading plan and accept that it doesn't always work. 
                        \nEven if the break is straightforward, the market can turn around for many reasons. Don't get frustrated and try to hold the position. You must be able to take your loss quickly if you identify a false signal or if the market suddenly turns around. If you do not, the false breaks will have too great a negative impact on the performance of your account. However, be careful not to confuse a reversal with a simple correction.Trades need room to breathe.

                        """,
                  child: Text("\nTrading for Dummies - Conclusion"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nKnowing how to identify a trend is a basic technical analysis element often overlooked by novice traders. However, identifying the trend not only helps limit the number of losing trades but also helps maximize gains on winning trades. A trend is an indispensable decision support tool, it gives you the main direction of the asset. It is therefore a study of the past (through price histories) that allows you to predict the most probable direction of an asset's price in the future.
                        \nTrends are reflections of all the investors’ psychology. They reflect phases of doubt, euphoria, panic, confidence, etc. with the various economic announcements on assets. Identifying trends enables you to understand investor psychology and exploit it for profit. On the market, we often say "The trend is your friend",

                        """,
                  child: Text("\nTrading for Dummies - Defining a Trend"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nAn asset may be in an upwards (bullish) or downwards (bearish) trend or horizontal (no trend).
                        \nIn a bullish trend, the high points are higher and higher, and the low points are less and less low. Conversely, in a bearish trend, the low points are lower and lower and the high points less and less high. In a phase of horizontal movement, the high points are at about the same level and so are the low points (range phase).
                        \nTo clearly identify the asset trend, you can also look at:
                        \nSudden movements: Sudden movements are generally in the direction of the trend. If you see large bullish candlesticks on your chart, it is because the trend is likely to be bullish and vice versa.
                        \nColour of the candlesticks: If you see a larger number of green candlesticks (bullish) on your chart, it means that the asset is in a bullish trend and conversely if there is a larger number of red candlesticks (bearish), the asset is in a bearish trend.

                        """,
                  child: Text("\nTrading for Dummies - Characteristics of Trends"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTo clearly identify the trend in the asset you wish to trade, the best way is to look at a unit of time longer than your trade. For example, if you are trading on a 4-hour day, look at the daily asset chart. If you trade on 15 minutes, look at the 1 hour chart. 
                        \nThe chart for the time unit of your trade is used to identify trading signals and the chart for the longer time unit is used to identify the trend.
                        \nIndeed, an asset may have a short-term trend opposite to its medium-term trend. You need to know that it is always the trend on the longest time unit that takes over. Of course, there can be trend reversals and that's why you need to set key reversal levels on the unit of time above your trade.

                        """,
                  child: Text("\nTrading for Dummies - Identifying Trends - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nI often see on forums that one should never trade against the trend. That’s not true. Counter trend trades are possible but you have to wait for clear signals and not be too greedy with price objectives. Effectively, movements are stronger in the direction of the trend.
                        \nAnalysing the unit of time longer than that of your trade allows you to set yourself a single direction to deal with (long, short or neutral). For example, if your main direction is long (bullish trend), you should ignore the sales signals on your signal chart (time unit of your trade).

                        """,
                  child: Text("\nTrading for Dummies - Identifying Trends - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTools available to confirm the trend
                        \nTo confirm the direction of the trend, you can use various tools:
                        \nMoving averages: Moving averages are the average value of an asset over a given period. They allow a simple reading of the trend without having to carry out an in-depth technical analysis. It is generally better to not choose moving averages that are too short term, and favour moving averages with a long calculation period instead. This smooths the trend and avoids having too many false trend reversal signals (moving average too reactive).
                        \nRelative currency strength index: This is a tool that allows you to compare the changes in one currency against a basket of other currencies. Clearly, it doesn’t indicate the trend of an asset but the trend of a currency on Forex. This gives an even more global view of the trend.

                        """,
                  child: Text("\nTrading for Dummies - TACT - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTools available to confirm the trend
                        \nThe stock exchange index: If you deal in shares, an analysis of the main index to which your shares are linked also gives you a global view. For example, if you are dealing Renault shares, you can do a CAC40 analysis. If you see that a strong sell signal has just been given on the index, you may want to avoid opening an upward position on your asset even if a bullish signal appears.
                        \nRemember: Never forget that the overall trend always outweighs shorter-term trends. 

                        """,
                  child: Text("\nTrading for Dummies - TACT - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nPitfalls to avoid in identifying a trend
                        \nDistinguish between short and medium term: Whether using your trend or signal chart, you must always have the widest possible view to identify whether the short-term trend is a trend or correction movement. To do this, identify the high/low points of the last large bullish/bearish movement and reveal the Fibonacci retracements. Movements in the direction of the trend are often more powerful (stronger amplitude) and brutal (large candlesticks). With a correction movement, the price is regularly blocked in its progression (closer price objectives). In addition, a correction movement is often part of a consolidation pattern (flags, pennants, bevels, etc.).
                        \nTrendless period: Some assets may not have a clear trend. The high/low points are one move higher, one move lower. During these periods, moving averages constantly change direction, reflecting investor indecision. These phases without a trend can happen with or without volatility. If there are sudden movements, they are often in both directions. In a period without a trend, your price objectives should be closer. I advise novice traders not to trade assets without a clearly visible trend.

                        """,
                  child: Text("\nTrading for Dummies - PAIT"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nDetecting trend reversals in trading 
                        \nDetecting trend reversals is very useful in trading. It enables you to protect your gains by cutting your position or taking a position in the opposite direction to the current trend (counter trend trading). Trend reversals occur on all time units. 
                        \nA reversal on a small unit of time does not mean that there will necessarily be a reversal on the longer unit of time. The change in the direction of the price can therefore be a reversal on one time unit and a simple correction on another time unit.
                        \nLet's look together at the tools at your disposal to detect a trend reversal.

                        """,
                  child: Text("\nTrading for Dummies - DTRT"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nDetecting trend reversals with Japanese candlesticks
                        \nJapanese candlesticks are the most widely used type of chart representation in technical analysis. They provide important information on investors’ psychology by displaying various data: opening price, closing price, and the highest and lowest prices over the candlestick’s period. Several configurations of Japanese candlesticks allow you to anticipate a correction or a reversal.
                        \nDojis:
                        \nDojis are candlesticks with a small body relative to the overall size of the candlestick. There are many types of dojis depending on whether the body is up, down, or in the middle, and whether you are in a bullish or bearish trend. Teaching you the different names is not the purpose of this article. Here's what you need to remember:
                        \nIn a bullish trend: If a doji with a large high fuse appears following a bullish movement, there is a high probability of a bearish reversal.

                        """,
                  child: Text("\nTrading for Dummies - DTRJC - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nDetecting trend reversals with Japanese candlesticks
                        \nIn a bearish trend: If a doji with a large low fuse appears following a bearish movement, there is a high probability of a bullish reversal.
                        \nIn a bullish/bearish trend: If a doji (small body in the middle) appears, there is a high probability of a reversal.

                        """,
                  child: Text("\nTrading for Dummies - DTRJC - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nDetecting trend reversals with Japanese candlesticks
                        \nEngulfings:
                        \nA bullish or bearish engulfing is a powerful Japanese candlestick configuration consisting of two candlesticks. The first bull or bear is wrapped by a second candlestick of a different colour.
                        \nIn a bullish trend, the first candlestick must be bullish and a second bearish candlestick must include the first. The second candlestick therefore closes below the first.
                        \nIn a bearish trend, the first candlestick must be bearish and a second bullish candlestick must include the first. The second candlestick closes above the first.
                        \nIn a bullish/bearish trend: If the second candlestick is of a different colour and encloses more than half of the previous candlestick, this may be a sign of a reversal. This is called a bullish/bearish piercing.

                        """,
                  child: Text("\nTrading for Dummies - DTRJC - Part 3"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nDetecting trend reversals with chart patterns
                        \nChart patterns are a very effective tool for detecting trend reversals. Some patterns are called reversal patterns. Here are the main ones:
                        \nDouble bottom/top - triple bottom/top:
                        \nIt is the break in the neck line of the line that gives the buy or sell signal. The theoretical objective is then calculated by plotting the height of the line onto the neck line.
                        \nAscending wedge / Descending wedge:
                        \nIn the case of an ascending wedge, a break in the lower boundary gives the sales signal. In the case of a descending wedge, a break in the upper boundary gives a buy signal. The break normally happens at 2/3 of the chart for the signal to be really relevant. 
                        
                        """,
                  child: Text("\nTrading for Dummies - DTRCP - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nDetecting trend reversals with chart patterns
                        \nHead and shoulders (H&S)/ Inverse head and shoulders (H&Si):
                        \nThis figure is similar to the double bottom/top. It is the break in the neck line of the line that gives the buy or sell signal. The theoretical objective is then calculated by plotting the height of the head onto the neck line. 

                        """,
                  child: Text("\nTrading for Dummies - DTRCP - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nDetecting trend reversals with technical indicators
                        \nWith technical indicators, it is possible to draw chart patterns like on a price chart. The operation of the buy/sell signals is then the same. The indicators also suggest other alternatives for detecting a trend reversal:
                        \nDivergence:
                        \nA divergence occurs when a technical indicator marks highs/lows that go in the opposite direction of the highs/lows on the asset price. 
                        \nExiting from an overbought/oversold zone:
                        \nA buy signal is given when the price leaves the oversold zone. A sales signal is given when the price leaves the overbought zone. Warning, the fact that the price is oversold / overbought is not a viable signal to detect a reversal. The best technical indicator for this is the RSI, (limited indicator between 0 and 100).
                        
                        """,
                  child: Text("\nTrading for Dummies - DTRTI"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThere are many tools for detecting trend reversals. They can be used individually or together for increased relevance. It is important to specify that the technical configurations of a reversal do not always lead to a reversal of the trend but can simply be the sign of a correction (of greater or lesser magnitude).

                        """,
                  child: Text("\nTrading for Dummies - Conclusion"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nSignals of Trend Recovery
                        \nKnowing how to identify the signals of a recovery in a bullish/bearish trend is a key element of technical analysis.As we often say "The trend is your friend". Novice traders look at trading against the trend, this is a mistake. When dealing with the trend, you have higher expectations of gains in terms of points. In addition, the risk is often lower. Trading against the trend is more the domain of experienced traders who know how to Would not interpret the chart patterns and the different signals perfectly.
                        \nThere are a lot of reversal trend signals. It is easy to find buying or selling opportunities using basic elements of technical analysis.

                        """,
                  child: Text("\nTrading for Dummies - STR"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTrend resumption signals in chart patterns
                        \nThe base pattern for technical analysis is the bullish/bearish channel. When the an assets’ trend is pronounced, this pattern often appears.
                        \nIn a bullish channel, the signal for a trend recovery is given when the price rebounds off the lower limit.
                        \nIn a bearish channel, the signal for a resumption of the trend is given when the price rebounds off the upper limit.
                        \nWarning, you must not open a position at the contact point with the high/low limit, it is essential to wait for a price reversal on the level before opening a position. Unless the price rebounds significantly off the low/high limit, you have to wait for a break in the slant that guides the correction movement within the channel.Here is an example with a bullish channel and the break of a bearish downward slant.

                        """,
                  child: Text("\nTrading for Dummies - TRSCP"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTrend recovery signal on consolidation figure output
                        \nSome chart patterns are consolidation patterns. The most common patterns you see after a big bullish/bearish rally are flags or pennants.
                        \nA pennant is a very short term chart pattern that resembles a small symmetrical triangle.In the case of an upward trend, the signal that the upward trend will resume is an upward exit. In the case of a bearish trend, the signal that the upward trend will resume is a downward exit. 
                        \nA flag is a chart pattern resembling a rectangle (or small channel) oriented in the opposite direction to the trend.In a bullish trend, the flag is pointing down and it is an upward exit that gives the signal that the trend has resumed.In a bearish trend, the flag is pointing up and it is a downward exit that gives the signal that the trend has resumed.
                        \nWarning: If ever the price exits the chart pattern in the opposite direction to the trend, do not take the buy/sell signal into account. The potential for an increase/decrease is very often limited. In that case look for another opportunity.

                        """,
                  child: Text("\nTrading for Dummies - TRSCFO"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTrend recovery signal on a technical indicator
                        \nThere are many technical indicators to detect a trend recovery.I will take the example of one of the most used: the RSI.If you need to use an indicator, choose this one. It allows you to detect discrepancies, identify an overbought/sold area exit, and generally view areas that show you a return of momentum in the direction of the trend.
                        
                        """,
                  child: Text("\nTrading for Dummies - TRSTI"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTrend recovery signals on resistances and supports
                        \nThe old supports and resistances are good entry points to detect a recovery in the trend. The recovery signal intervenes either when the price makes a pullback on the level, or when the price course breaks the level again in the direction of the trend (in the case of a more forceful correction).
                        \nYou can also use Fibonacci retracements to identify trend recovery signals.In the case of an upward trend, the signal is given when the price breaks an upward retracement.In the case of a bearish trend, the signal is given when the price breaks a downwards retracement.

                        """,
                  child: Text("\nTrading for Dummies - TRSRS"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nHow long should I keep my position open? This is a question that many novices in the trading world are asking themselves.You should know that there is no rule, the duration of a trade depends on several factors.

                        """,
                  child: Text("\nTrading for Dummies - Duration of a Trade"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThe duration of your trade initially depends on your trade’s time unit. The longer the base time unit is, the longer the trade will typically be. A daily trade, for example, will be kept several days and even weeks while a 1 hour trade will only be kept for a few hours or one day.
                        \nIf you use Japanese candlesticks as a graphic representation, be aware that a candlestick represents a unit of time. For your scenario to come to fruition, several candlesticks must elapse.

                        """,
                  child: Text("\nTrading for Dummies - The Time Unit"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nWhatever time unit you use in your trading, the duration of your trade depends on several elements.Whatever the duration of your trade, it is one of these 3 elements which must lead your trade closing:
                        \nYour stop loss: The further it is from your entry point, the longer the duration of your trade. But be careful not to place your stop too far, your trade must have a promising gain/risk ratio.You can consult the file: How to place your stop loss.Let me remind you that a stop loss is mandatory on each of your positions!
                        \nYour objective: The further away it is, the potentially longer the duration of your trade. You could also not have a price objective and stay in a position until the movement is exhausted.
                        \nExpectations: The duration of your trade depends on your expectations during the trade. For example, if you anticipate a major correction, you may decide to cut your trade prematurely even if the target has not been reached.These expectations are based on reading your chart with chart patterns, technical indicators and even economic announcements (see trading on economic announcements).

                        """,
                  child: Text("\nTrading for Dummies - Exiting a Trade"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nThe duration of your trade also depends on your trading style. Firstly, there is a big difference between scalping and swing trading.
                        \nIf you are scalping, the duration of your trades will be extremely short.This can range from a few seconds to several minutes maximum.Warning, scalping seems simple but should be left to experienced traders who know perfectly well how to manage their risks, their emotions and who are able to react quickly to price movements.
                        \nIf you swing trade, then the duration of your trade is very variable and will depend on the time unit chosen.Some traders prefer day trading (i.e. cutting off all their positions at the end of the day) and will focus on smaller time units and others will let their trades carry over several days by trading on larger time units.
                        \nYour choice of trading style depends on the time you have to trade and also on your trading preferences. These together form your investor profile. 

                        """,
                  child: Text("\nTrading for Dummies - Trading Style"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nSpecificities of Forex
                        \nUse of margin: Each of your trades uses margin on your trading account (You can consult the page: “Required margin and margin call”, for more information).If you have a small account, the margin used can quickly be significant, which can block part of your capital (see margin required calculation tool).If you detect an interesting trading opportunity, you may not be able to trade it (especially if you have a small account).If the duration of your trades is long, you have to take this factor into account. The more leverage you use, the more margin you use.
                        \nI would just give you one piece of advice: don't use leverage!For a new trader, it's an enemyIt will often only accelerate the amount of your losses.If you are new to trading, the initial goal is not to earn money but to last!If you have less than €500, it is pointless to open a Forex trading account (see: Money management with a small Forex account).

                        """,
                  child: Text("\nTrading for Dummies - SF - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nSpecificities of Forex
                        \nSwap :A Forex swap (a rollover) is a daily transaction that takes place at 11 p.m. CET on your Forex account.For more information, see :SWAP on Forex.The swap may be in your favour or against you depending on the interest rates on the currencies you trade and the direction of your position.If the swap is against you, you will pay your broker a commission every night.The longer the duration of your trade, the greater the impact the swap has on performance.If you trade on large time units, then this is an element to consider.You can use our swap calculation tool to give you an idea of the amount.Warning, the swap amount is different depending on the broker, each broker applies its own commissions.

                        """,
                  child: Text("\nTrading for Dummies - SF - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTaking a position and exiting a trade 
                        \nNovice traders proliferate trading errors in their early days.Among the main ones, one can cite overusing leverage, a non-existent risk management, entering and exiting positions without a trading strategy, refusal to accept losses and also greediness.When they win, they want to win a lot.They tell themselves that the fact that their scenario is good, that they have analysed well should enable them to generate big profits on a single trade.Without necessarily using leverage, they want to capture large movements.They do not accept taking only a part of the movement.Almost all novice traders aspire to this, to harness the entire bullish or bearish wave.Yet it is impossible.If this has happened to you, it is only because of luck and not because of your talent as a trader.

                        """,
                  child: Text("\nTrading for Dummies - TPET"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nNovices always try to anticipate movements.To do this, they take an early position without waiting for a real buy/sell signal.For example, they will open a buy/sell position simply because the price just hit a support/resistance.Another classic consists in anticipating the release of a chart pattern.For example, if a HaS chart pattern is formed, they will buy/sell without waiting for the neck line to break.
                        \nThese are serious mistakes.You should always wait for a buy/sell signal from your trading strategy to open a position.Buying or selling just because the chart configuration seems bullish/bearish to you is not enough.This will greatly increase your number of losing trades.Let's take a classic case with a double/triple top.If you sell before the neck line is broken, the chart has not yet been validated.Who told you that this is not just a consolidation range and that a bullish exit is not going to happen?
                        \nI took the example of chart patterns, but I could also have taken the example of a technical indicator with divergences.Differences generally work rather well on large time units but opening any position must be confirmed by a buy/sell signal on your price chart.
                        
                        """,
                  child: Text("\nTrading for Dummies - Taking a Position - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTo secure your entries and reduce your number of losing trades, you must therefore accept losing part of the movement, usually the beginning of the wave.It is precisely this first impulse that allows you to validate your bullish/bearish scenario and thus allows you to open a position under appropriate conditions.If your analysis is good, then the chances of the movement continuing are greater.
                        
                        """,
                  child: Text("\nTrading for Dummies - Taking a Position - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nIf the buy/sell signal is not a false start which hits your stop loss, you have two options to exit the position.Either you have set a price objective (before opening a position!), or you let the movement carry you until the first signs of reversal.
                        \nExiting by objective: Exiting by objective does not mean that you should not be active during your trade.It is indeed rare that the price follows a straight line to your objective (unless it is close).You have to increase your stop loss incrementally to first reduce your risk and then, incrementally protect your gains.This can be done manually or via a trailing stop.
                        \nExit on exhaustion of movement: The signs of exhaustion in the movement are diverse but they are often seen by analysing the Japanese candlesticks (formation of reversed dojis, smaller and smaller candlesticks, etc.(See: Detect a trend reversal in trading), chart patterns and also technical indicators (especially those there because of divergences). 
                        
                        """,
                  child: Text("\nTrading for Dummies - Exiting a Position - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nWhichever method you choose, you will not exit your trade at the high/low end.Even if you watch out for the movement to be exhausted, you have to wait for confirmation to cut your trade and therefore lose part of the movement.When exiting by objective, the movement may continue afterwards (it is important to set realistic price objectives that have a higher probability of being achieved).

                        """,
                  child: Text("\nTrading for Dummies - Exiting a Position - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nTo trade in appropriate conditions, it is essential for you to accept that you will lose part of the movement at the time of opening the position and also when exiting a trade.It is because of this that it is impossible to buy at the lowest and sell at the highest.If you hope to be able to do so, you will inevitably end up losing your capital.

                        """,
                  child: Text("\nTrading for Dummies - Conclusion"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nCapital gains management for a trading account
                        \nA good trader always has maximum loss targets and maximum trading performance targets.
                        \nThese objectives are daily, weekly and/or monthly.
                        \nIn practice, here is an example of what this produces: a trader sets his objective to make 0.25% a day, 1% a week, or 4% a month. As soon as one of his objectives is reached, he stops trading. These objectives are reached. If there are losses, the trader has also set his objectives: 0.15% a day, 0.75% a week, or 2.5% a month. As soon as one of his maximum loss targets is reached, he stops trading.
                        \nThis is just one example. Generally, traders outperform their profit targets but stop correctly if their maximum loss targets are reached.

                        """,
                  child: Text("\nTrading for Dummies - CGMTA - Part 1"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nCapital gains management for a trading account
                        \nIn the long run, a trader manages to generate profits, but what does he do with them?
                        \nMost traders who generate profits on their trading account keep all gains directly ON their trading account. Each month, the capital gains recorded become an integral part of the capital. More and more capital for more and more profits? Don't you end up by never taking advantage of your added value with this management? Aren't we likely to one day see all our capital gains, recorded over X years, go up in smoke on a "folly". Crushing! 
                        \nThis is where I think you have to know how to manage your added value properly.

                        """,
                  child: Text("\nTrading for Dummies - CGMTA - Part 2"),
                ),
                DropdownMenuItem<String>(
                  value: """

                        \nCapital gains management for a trading account
                        \nHere is an example of what could be done: 
                        \n50% of the capital gains become capital, allowing the trader to also cover any possible losses in the following months. If there are successive profitable months, the capital increases so generating more and more profits.
                        \n50% of the capital gains are transferred back directly to your bank account. It's up to you to take advantage of it. Keep it to accumulate a nice little capital nest egg, which you could use to give yourself the car of your dreams, a trip, or a simple bouquet of flowers for your wife. This capital, nest egg, set aside could also be used to open another trading account in case of losses on a psychological breakdown.
                        \nWhat do you think of that?
                        \nThe percentages quoted are not necessarily the most accurate, but what is your opinion?

                        """,
                  child: Text("\nTrading for Dummies - CGMTA - Part 3"),
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
                    $precent += 0.01282051;
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
