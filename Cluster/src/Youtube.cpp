#include "YouTubeAPI.h"

YouTubeAPI::YouTubeAPI(QObject *parent)
    : QObject(parent), m_networkManager(new QNetworkAccessManager(this))
{
    connect(m_networkManager, &QNetworkAccessManager::finished, this, &YouTubeAPI::onSearchFinished);
}

void YouTubeAPI::searchVideos(const QString& apiKey, const QString& query)
{
    // YouTube API 검색 요청 URL 설정
    QString apiUrl = QString("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=%1&key=%2").arg(query).arg(apiKey);
    QNetworkRequest request(apiUrl);

    m_networkManager->get(request);
}

void YouTubeAPI::onSearchFinished(QNetworkReply *reply)
{
    if (reply->error() == QNetworkReply::NoError) {
        QByteArray responseData = reply->readAll();
        QJsonDocument responseJson = QJsonDocument::fromJson(responseData);

        QJsonObject responseObject = responseJson.object();
        QJsonArray videoItems = responseObject["items"].toArray();

        emit searchResult(videoItems);
    } else {
        // 오류 처리
    }

    reply->deleteLater();
}

