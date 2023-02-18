import 'package:http/http.dart' as http;
import 'package:do_an_cuoi_ki/models/news_api.dart';
import 'dart:convert';

import 'package:do_an_cuoi_ki/secret.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: content,
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}


class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    String url ="http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    print(jsonData['status']);
    print(url);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: content,
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

const String content = "New York, Feb. 08, 2023 (GLOBE NEWSWIRE) -- Reportlinker.com announces the release of the report 'Commercial Electric Vehicles Global Market Report 2023' - https://www.reportlinker.com/p06280936/?utm_source=GNWMajor\n"
    " players in the commercial electric vehicle market are Tesla, Nissan, BMW, Chevrolet, Ford, Volkswagen, Kia Motors, Audi, BYD, and Daimler.The global commercial electric vehicle market is expected to grow from 68.43 billion in 2021 to \n"
    " 101.44 billion in 2022 at a compound annual growth rate (CAGR) of 48.2%. The Russia-Ukraine war disrupted the chances of global economic recovery from the COVID-19 pandemic, at least in the short term. The war between these two countries has led to economic sanctions on multiple countries,\n"
    " surge in commodity prices, and supply chain disruptions, causing inflation across goods and services effecting many markets across the globe. The commercial electric vehicle market is expected to grow to 303.15 billion in 2026 at a CAGR of 31.5%.The commercial electric vehicles market consists of sales of hybrid electric vehicles (HEVs) and extended range electric vehicles (E-REVs).Values in this market are ‘factory gate’ values, that is the value of goods sold by the manufacturers or creators of the goods, whether to other entities (including downstream manufacturers, wholesalers, distributors and retailers) or directly to end customers.The value of goods in this market includes related services sold by the creators of the goods.Commercial electric\n"
    " vehicles are electrically powered, self-propelled electric vehicles used for transportation that help reduce greenhouse gas emissions (GHG) and pollution and work with the help of both electric motors working in tandem.The main technologies in commercial electric vehicles are battery electric vehicles, hybrid electric vehicles, and plug-in hybrid electric vehicles.Battery electric vehicles operate only on stored electricity, and their main components consist of a high-voltage battery, one or more electric motors (either alternating current [AC] or direct current [DC]), and a controller for managing the power electronics.The vehicle types involved are buses, trucks, pick-up trucks, and vans. The charging infrastructure involved is pantograph, plug-in,\n"
    " and inductive.Government subsidies to consumers and manufacturers help with the adoption of electric vehicles.The adoption of electric vehicles has been identified as an effective method to reduce carbon emissions and dependency on fossil fuels.So, the governments of many countries are providing direct subsidies to both buyers and manufacturers to increase the adoption rate of electric vehicles.For example, in order to make electric vehicles (EVs) accessible to all Americans for both short- and long-distance travel, the federal government has set the 2030 target of having half of all new vehicles sold in the country be zero-emissions vehicles.It has also committed to developing a practical and equitable network of 500,000 chargers.The difference in\n"
    " vehicle performance acts as a restraint on the growth of the commercial electric vehicle market.Electric vehicles provide excellent torque at low speeds, but at higher speeds, the performance drops.";

