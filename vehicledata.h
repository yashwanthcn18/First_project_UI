#ifndef VEHICLEDATA_H
#define VEHICLEDATA_H

#include <QObject>
#include <qobject.h>

class VehicleData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int progressBar READ progressBar WRITE setProgressBar NOTIFY progressBarChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
    Q_PROPERTY(int batteryIndicator READ batteryIndicator WRITE setBatteryIndicator NOTIFY batteryIndicatorChanged)
    Q_PROPERTY(QString hundredText READ hundredText WRITE setHundredText NOTIFY hundredTextChanged)

public:
    explicit VehicleData(QObject *parent = nullptr);

    //Getter function
    int speed() const;
    int progressBar() const;
    QString text() const;
    int batteryIndicator() const;
    QString hundredText() const;


    //Setter function
    void setSpeed(int newSpeed);
    void setProgressBar(int newProgressBar);
    void setText(QString newText);
    void setBatteryIndicator(int newBatteryIndicator);
    void setHundredText (QString newHundredText);

    Q_INVOKABLE void handleKeyPress(int keyCode);
signals:
    void speedChanged(int newSpeed);
    void progressBarChanged(int newProgressBar);
    void textChanged(QString newText);
    void batteryIndicatorChanged(int newBatteryIndicator);
    void hundredTextChanged(QString newHundredText);


private:
    int m_speed;
    int m_progressBar;
    QString m_text;
    int m_batteryIndicator;
    QString m_hundredText;
};

#endif // VEHICLEDATA_H
