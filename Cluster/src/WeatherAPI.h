#ifndef WEATHERAPI_H
#define WEATHERAPI_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class WeatherAPI : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString weatherIcon READ weatherIcon NOTIFY weatherUpdated)
    Q_PROPERTY(QString temperature READ temperature NOTIFY weatherUpdated)

public:
    explicit WeatherAPI(QObject *parent = nullptr);
    Q_INVOKABLE void requestWeather(const QString &city);

    QString weatherIcon() const;
    QString temperature() const;

signals:
    void weatherUpdated();

private slots:
    void onWeatherDataReceived(QNetworkReply *reply);

private:
    QNetworkAccessManager *networkManager;
    QString apiKey;

    // New member variables
    QString m_weatherIcon;
    QString m_temperature;
};

#endif // WEATHERAPI_H
