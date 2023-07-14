#ifndef YOUTUBE_H
#define YOUTUBE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

class YouTubeAPI : public QObject
{
    Q_OBJECT

public:
    explicit YouTubeAPI(QObject *parent = nullptr);

    void searchVideos(const QString& apiKey, const QString& query);

signals:
    void searchResult(const QJsonArray& videos);

private slots:
    void onSearchFinished(QNetworkReply *reply);

private:
    QNetworkAccessManager *m_networkManager;
};

#endif // YOUTUBE_H

