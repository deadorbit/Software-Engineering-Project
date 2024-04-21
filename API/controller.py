######
#
# python -m uvicorn controller:app --port 5000
#
######

# create fastapi controller
from fastapi import FastAPI
from main import write_to_json_file
import json
import pandas as pd
import yfinance as yahooFinance


app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/ping")
async def ping():
    return {"message": "pong"}


@app.get("/stock/{stock_symbol}/time/{timeframe}")
async def get_stock_cost(stock_symbol: str, timeframe: str):
    """... (Your docstring) ..."""

    # Get stock information
    stock_information = yahooFinance.Ticker(stock_symbol).history(period=timeframe)

    # Convert to JSON and return directly
    return stock_information.to_dict(orient='records') 


@app.get("/stock/{stock_symbol}/info")
async def get_stock_info(stock_symbol: str):
    """
    This function retrieves stock information related to a specific stock symbol.
    Parameters:
    stock_symbol (str): The symbol of the stock for which information is to be retrieved.
    Returns:
    dict: A dictionary containing stock information related to the specified stock symbol.
    """
    # get stock information
    stock_information = yahooFinance.Ticker(stock_symbol)
    return stock_information.info


@app.get("/stock/{stock_symbol}/news")
async def get_stock_news(stock_symbol: str):
    """
    This function retrieves news related to a specific stock symbol.
    Parameters:
    stock_symbol (str): The symbol of the stock for which news is to be retrieved.
    Returns:
    list: A list of news articles related to the specified stock symbol.
    """
    # get stock news
    stock_information = yahooFinance.Ticker(stock_symbol)
    return stock_information.news


# @app.get("/stock/{stock_symbol}/news")
# async def get_stock_news(stock_symbol: str):
#     """
#     Get stock news for the given stock symbol.
    
#     Parameters:
#     - stock_symbol: str, the symbol of the stock
    
#     Returns:
#     - stock_information.news
#     """
#     return stock_information.news



# ----------------------------------
# JUST IN CASE
# ----------------------------------
# yahoo.py
# import yfinance as yahooFinance
# from main import write_to_json_file
# import json
# import pandas as pd
# write general info to JSON file
# write_to_json_file(json_data=json.dumps(stock_information.info), stock_symbol=stock_symbol)

# Get detailed stock information based on selected timeframe
# Need to convert fomr returned dataframe to JSON
# df = pd.DataFrame(stock_information.history(period="1mo"))
# json_data = df.to_json(orient='records')
# write_to_json_file(json_data=json_data, stock_symbol=stock_symbol+'_history')

