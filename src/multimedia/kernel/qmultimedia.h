/***********************************************************************
*
* Copyright (c) 2012-2018 Barbara Geller
* Copyright (c) 2012-2018 Ansel Sermersheim
* Copyright (c) 2012-2016 Digia Plc and/or its subsidiary(-ies).
* Copyright (c) 2008-2012 Nokia Corporation and/or its subsidiary(-ies).
* All rights reserved.
*
* This file is part of CopperSpice.
*
* CopperSpice is free software. You can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public License
* version 2.1 as published by the Free Software Foundation.
*
* CopperSpice is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*
* <http://www.gnu.org/licenses/>.
*
***********************************************************************/

#ifndef QMULTIMEDIA_H
#define QMULTIMEDIA_H

#include <QtCore/qpair.h>
#include <QtCore/qmetatype.h>
#include <QtCore/qstring.h>

namespace QMultimedia
{
    enum SupportEstimate
    {
        NotSupported,
        MaybeSupported,
        ProbablySupported,
        PreferredService
    };

    enum EncodingQuality
    {
        VeryLowQuality,
        LowQuality,
        NormalQuality,
        HighQuality,
        VeryHighQuality
    };

    enum EncodingMode
    {
        ConstantQualityEncoding,
        ConstantBitRateEncoding,
        AverageBitRateEncoding,
        TwoPassEncoding
    };

    enum AvailabilityStatus
    {
        Available,
        ServiceMissing,
        Busy,
        ResourceError
    };

}

Q_DECLARE_METATYPE(QMultimedia::AvailabilityStatus)
Q_DECLARE_METATYPE(QMultimedia::SupportEstimate)
Q_DECLARE_METATYPE(QMultimedia::EncodingMode)
Q_DECLARE_METATYPE(QMultimedia::EncodingQuality)


#endif
