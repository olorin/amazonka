{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EMR.DescribeStep
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Provides more detail about the cluster step.
--
-- <http://docs.aws.amazon.com/ElasticMapReduce/latest/API/API_DescribeStep.html>
module Network.AWS.EMR.DescribeStep
    (
    -- * Request
      DescribeStep
    -- ** Request constructor
    , describeStep
    -- ** Request lenses
    , dsrqClusterId
    , dsrqStepId

    -- * Response
    , DescribeStepResponse
    -- ** Response constructor
    , describeStepResponse
    -- ** Response lenses
    , dsrsStep
    , dsrsStatus
    ) where

import           Network.AWS.EMR.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | This input determines which step to describe.
--
-- /See:/ 'describeStep' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsrqClusterId'
--
-- * 'dsrqStepId'
data DescribeStep = DescribeStep'
    { _dsrqClusterId :: !Text
    , _dsrqStepId    :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeStep' smart constructor.
describeStep :: Text -> Text -> DescribeStep
describeStep pClusterId_ pStepId_ =
    DescribeStep'
    { _dsrqClusterId = pClusterId_
    , _dsrqStepId = pStepId_
    }

-- | The identifier of the cluster with steps to describe.
dsrqClusterId :: Lens' DescribeStep Text
dsrqClusterId = lens _dsrqClusterId (\ s a -> s{_dsrqClusterId = a});

-- | The identifier of the step to describe.
dsrqStepId :: Lens' DescribeStep Text
dsrqStepId = lens _dsrqStepId (\ s a -> s{_dsrqStepId = a});

instance AWSRequest DescribeStep where
        type Sv DescribeStep = EMR
        type Rs DescribeStep = DescribeStepResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DescribeStepResponse' <$>
                   (x .?> "Step") <*> (pure (fromEnum s)))

instance ToHeaders DescribeStep where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("ElasticMapReduce.DescribeStep" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeStep where
        toJSON DescribeStep'{..}
          = object
              ["ClusterId" .= _dsrqClusterId,
               "StepId" .= _dsrqStepId]

instance ToPath DescribeStep where
        toPath = const "/"

instance ToQuery DescribeStep where
        toQuery = const mempty

-- | This output contains the description of the cluster step.
--
-- /See:/ 'describeStepResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsrsStep'
--
-- * 'dsrsStatus'
data DescribeStepResponse = DescribeStepResponse'
    { _dsrsStep   :: !(Maybe Step)
    , _dsrsStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeStepResponse' smart constructor.
describeStepResponse :: Int -> DescribeStepResponse
describeStepResponse pStatus_ =
    DescribeStepResponse'
    { _dsrsStep = Nothing
    , _dsrsStatus = pStatus_
    }

-- | The step details for the requested step identifier.
dsrsStep :: Lens' DescribeStepResponse (Maybe Step)
dsrsStep = lens _dsrsStep (\ s a -> s{_dsrsStep = a});

-- | FIXME: Undocumented member.
dsrsStatus :: Lens' DescribeStepResponse Int
dsrsStatus = lens _dsrsStatus (\ s a -> s{_dsrsStatus = a});