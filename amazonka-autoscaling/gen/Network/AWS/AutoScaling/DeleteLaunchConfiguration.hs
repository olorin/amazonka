{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AutoScaling.DeleteLaunchConfiguration
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified launch configuration.
--
-- The launch configuration must not be attached to an Auto Scaling group.
-- When this call completes, the launch configuration is no longer
-- available for use.
--
-- <http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_DeleteLaunchConfiguration.html>
module Network.AWS.AutoScaling.DeleteLaunchConfiguration
    (
    -- * Request
      DeleteLaunchConfiguration
    -- ** Request constructor
    , deleteLaunchConfiguration
    -- ** Request lenses
    , dlcrqLaunchConfigurationName

    -- * Response
    , DeleteLaunchConfigurationResponse
    -- ** Response constructor
    , deleteLaunchConfigurationResponse
    ) where

import           Network.AWS.AutoScaling.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteLaunchConfiguration' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dlcrqLaunchConfigurationName'
newtype DeleteLaunchConfiguration = DeleteLaunchConfiguration'
    { _dlcrqLaunchConfigurationName :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteLaunchConfiguration' smart constructor.
deleteLaunchConfiguration :: Text -> DeleteLaunchConfiguration
deleteLaunchConfiguration pLaunchConfigurationName_ =
    DeleteLaunchConfiguration'
    { _dlcrqLaunchConfigurationName = pLaunchConfigurationName_
    }

-- | The name of the launch configuration.
dlcrqLaunchConfigurationName :: Lens' DeleteLaunchConfiguration Text
dlcrqLaunchConfigurationName = lens _dlcrqLaunchConfigurationName (\ s a -> s{_dlcrqLaunchConfigurationName = a});

instance AWSRequest DeleteLaunchConfiguration where
        type Sv DeleteLaunchConfiguration = AutoScaling
        type Rs DeleteLaunchConfiguration =
             DeleteLaunchConfigurationResponse
        request = post
        response
          = receiveNull DeleteLaunchConfigurationResponse'

instance ToHeaders DeleteLaunchConfiguration where
        toHeaders = const mempty

instance ToPath DeleteLaunchConfiguration where
        toPath = const "/"

instance ToQuery DeleteLaunchConfiguration where
        toQuery DeleteLaunchConfiguration'{..}
          = mconcat
              ["Action" =:
                 ("DeleteLaunchConfiguration" :: ByteString),
               "Version" =: ("2011-01-01" :: ByteString),
               "LaunchConfigurationName" =:
                 _dlcrqLaunchConfigurationName]

-- | /See:/ 'deleteLaunchConfigurationResponse' smart constructor.
data DeleteLaunchConfigurationResponse =
    DeleteLaunchConfigurationResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteLaunchConfigurationResponse' smart constructor.
deleteLaunchConfigurationResponse :: DeleteLaunchConfigurationResponse
deleteLaunchConfigurationResponse = DeleteLaunchConfigurationResponse'