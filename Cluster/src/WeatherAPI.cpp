#include "WeatherAPI.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

WeatherAPI::WeatherAPI(QObject *parent) : QObject(parent)
{
    networkManager = new QNetworkAccessManager(this);
    apiKey = "db0e6070daf9ce1af767fd9d515255f6"; // Replace with your OpenWeatherMap API key

    connect(networkManager, &QNetworkAccessManager::finished,
            this, &WeatherAPI::onWeatherDataReceived);
}

void WeatherAPI::requestWeather(const QString &city)
{
    QString requestUrl = QString("http://api.openweathermap.org/data/2.5/weather?q=%1&units=metric&appid=%2").arg(city, apiKey);
    networkManager->get(QNetworkRequest(QUrl(requestUrl)));
}

void WeatherAPI::onWeatherDataReceived(QNetworkReply *reply)
{
    if (reply->error() == QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonObject json = doc.object();
        m_weatherIcon = json["weather"].toArray().first().toObject()["icon"].toString();
        m_temperature = QString::number(json["main"].toObject()["temp"].toDouble());

        emit weatherUpdated();
    }
}

QString WeatherAPI::weatherIcon() const {
    return "http://openweathermap.org/img/w/" + m_weatherIcon + ".png";
}

QString WeatherAPI::temperature() const {
    return m_temperature;
}
