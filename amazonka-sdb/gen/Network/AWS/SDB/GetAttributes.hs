{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SDB.GetAttributes
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Returns all of the attributes associated with the specified item.
-- Optionally, the attributes returned can be limited to one or more
-- attributes by specifying an attribute name parameter.
--
-- If the item does not exist on the replica that was accessed for this
-- operation, an empty set is returned. The system does not return an error
-- as it cannot guarantee the item does not exist on other replicas.
--
-- <http://docs.aws.amazon.com/AmazonSimpleDB/latest/DeveloperGuide/SDB_API_GetAttributes.html>
module Network.AWS.SDB.GetAttributes
    (
    -- * Request
      GetAttributes
    -- ** Request constructor
    , getAttributes
    -- ** Request lenses
    , garqConsistentRead
    , garqAttributeNames
    , garqDomainName
    , garqItemName

    -- * Response
    , GetAttributesResponse
    -- ** Response constructor
    , getAttributesResponse
    -- ** Response lenses
    , garsAttributes
    , garsStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SDB.Types

-- | /See:/ 'getAttributes' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'garqConsistentRead'
--
-- * 'garqAttributeNames'
--
-- * 'garqDomainName'
--
-- * 'garqItemName'
data GetAttributes = GetAttributes'
    { _garqConsistentRead :: !(Maybe Bool)
    , _garqAttributeNames :: !(Maybe [Text])
    , _garqDomainName     :: !Text
    , _garqItemName       :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetAttributes' smart constructor.
getAttributes :: Text -> Text -> GetAttributes
getAttributes pDomainName_ pItemName_ =
    GetAttributes'
    { _garqConsistentRead = Nothing
    , _garqAttributeNames = Nothing
    , _garqDomainName = pDomainName_
    , _garqItemName = pItemName_
    }

-- | Determines whether or not strong consistency should be enforced when
-- data is read from SimpleDB. If @true@, any data previously written to
-- SimpleDB will be returned. Otherwise, results will be consistent
-- eventually, and the client may not see data that was written immediately
-- before your read.
garqConsistentRead :: Lens' GetAttributes (Maybe Bool)
garqConsistentRead = lens _garqConsistentRead (\ s a -> s{_garqConsistentRead = a});

-- | The names of the attributes.
garqAttributeNames :: Lens' GetAttributes [Text]
garqAttributeNames = lens _garqAttributeNames (\ s a -> s{_garqAttributeNames = a}) . _Default;

-- | The name of the domain in which to perform the operation.
garqDomainName :: Lens' GetAttributes Text
garqDomainName = lens _garqDomainName (\ s a -> s{_garqDomainName = a});

-- | The name of the item.
garqItemName :: Lens' GetAttributes Text
garqItemName = lens _garqItemName (\ s a -> s{_garqItemName = a});

instance AWSRequest GetAttributes where
        type Sv GetAttributes = SDB
        type Rs GetAttributes = GetAttributesResponse
        request = post
        response
          = receiveXMLWrapper "GetAttributesResult"
              (\ s h x ->
                 GetAttributesResponse' <$>
                   (may (parseXMLList "Attribute") x) <*>
                     (pure (fromEnum s)))

instance ToHeaders GetAttributes where
        toHeaders = const mempty

instance ToPath GetAttributes where
        toPath = const "/"

instance ToQuery GetAttributes where
        toQuery GetAttributes'{..}
          = mconcat
              ["Action" =: ("GetAttributes" :: ByteString),
               "Version" =: ("2009-04-15" :: ByteString),
               "ConsistentRead" =: _garqConsistentRead,
               toQuery
                 (toQueryList "AttributeName" <$>
                    _garqAttributeNames),
               "DomainName" =: _garqDomainName,
               "ItemName" =: _garqItemName]

-- | /See:/ 'getAttributesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'garsAttributes'
--
-- * 'garsStatus'
data GetAttributesResponse = GetAttributesResponse'
    { _garsAttributes :: !(Maybe [Attribute])
    , _garsStatus     :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetAttributesResponse' smart constructor.
getAttributesResponse :: Int -> GetAttributesResponse
getAttributesResponse pStatus_ =
    GetAttributesResponse'
    { _garsAttributes = Nothing
    , _garsStatus = pStatus_
    }

-- | The list of attributes returned by the operation.
garsAttributes :: Lens' GetAttributesResponse [Attribute]
garsAttributes = lens _garsAttributes (\ s a -> s{_garsAttributes = a}) . _Default;

-- | FIXME: Undocumented member.
garsStatus :: Lens' GetAttributesResponse Int
garsStatus = lens _garsStatus (\ s a -> s{_garsStatus = a});