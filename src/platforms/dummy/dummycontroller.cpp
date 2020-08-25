#include "dummycontroller.h"
#include "server.h"

#include <QDebug>
#include <QTimer>

DummyController::DummyController()
{
    m_timer = new QTimer(this);
    m_timer->setSingleShot(true);
}

void DummyController::activate(const Server &server, const Device *device, const Keys *keys)
{
    Q_UNUSED(device);
    Q_UNUSED(keys);

    qDebug() << "DummyController activated" << server.hostname();

    m_timer->stop();
    m_timer->start(2000);
    m_timer->disconnect();
    connect(m_timer, &QTimer::timeout, this, &ControllerImpl::connected);
}

void DummyController::deactivate(const Server &server, const Device *device, const Keys *keys)
{
    Q_UNUSED(device);
    Q_UNUSED(keys);

    qDebug() << "DummyController deactivated" << server.hostname();

    m_timer->stop();
    m_timer->start(2000);
    m_timer->disconnect();
    connect(m_timer, &QTimer::timeout, this, &ControllerImpl::disconnected);
}
