#include "vehicledata.h"
#include <QKeyEvent>

VehicleData::VehicleData(QObject *parent)
    : QObject{parent}, m_speed(36), m_progressBar(20),m_text("ECO MODE"), m_batteryIndicator(173),m_hundredText("100%")
{}

int VehicleData::speed() const
{
    return m_speed;
}

int VehicleData::progressBar() const
{
    return m_progressBar;
}

QString VehicleData::text() const
{
    return m_text;
}

int VehicleData::batteryIndicator() const
{
    return m_batteryIndicator;
}

QString VehicleData::hundredText() const
{
    return m_hundredText;
}


void VehicleData::setSpeed(int newSpeed)
{
    if(newSpeed != m_speed ){
        m_speed = newSpeed;
        emit speedChanged(newSpeed);
    }
}

void VehicleData::setProgressBar(int newProgressBar)
{
    if(newProgressBar != m_progressBar ){
        m_progressBar = newProgressBar;
        emit progressBarChanged(newProgressBar);
    }
}

void VehicleData::setText(QString newText)
{
    if(newText != m_text ){
        m_text = newText;
        emit textChanged(newText);
    }
}

void VehicleData::setBatteryIndicator(int newBatteryIndicator)
{
    if(newBatteryIndicator != m_batteryIndicator ){
        m_batteryIndicator = newBatteryIndicator;
        emit batteryIndicatorChanged(newBatteryIndicator);
    }
}

void VehicleData::setHundredText(QString newHundredText)
{
    if(newHundredText != m_hundredText ){
        m_hundredText = newHundredText;
        emit hundredTextChanged(newHundredText);
    }
}
//Function to handle keyboard input and change the mode
void VehicleData::handleKeyPress(int keyCode) {
    switch(keyCode) {
    case Qt::Key_1:
        setSpeed(0);
        setProgressBar(90);
        setText("Battery temperature high. Contact Service Center");
        setBatteryIndicator(300);
        setHundredText("78%");
        break;
    case Qt::Key_2:
        setSpeed(0);
        setProgressBar(20);
        setText("REVERSE");
        setBatteryIndicator(300);
        setHundredText("78%");
        break;
    case Qt::Key_3:
        setSpeed(36);
        setProgressBar(20);
        setText("ECO MODE");
        setBatteryIndicator(360);
        setHundredText("100%");
        break;
    case Qt::Key_4:
        setSpeed(36);
        setProgressBar(20);
        setText("HANDBRAKE");
        setBatteryIndicator(360);
        setHundredText("100%");
        break;
    case Qt::Key_5:
        setSpeed(36);
        setProgressBar(20);
        setText("BRAKE FLUID LOW");
        setBatteryIndicator(40);
        setHundredText("5%");
        break;
    default:
        setSpeed(36);
        setProgressBar(20);
        setText("ECO MODE");
        setBatteryIndicator(360);
        setHundredText("100%");
        break;
    }

}
