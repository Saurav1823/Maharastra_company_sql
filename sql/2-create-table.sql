CREATE TABLE company (
    cin TEXT,
    companyname TEXT,
    companyroc TEXT,
    companycategory TEXT,
    companysubcategory TEXT,
    companyclass TEXT,
    authorized_cap FLOAT,
    paidup_cap FLOAT,
    date_of_registration DATE,
    registered_office_address TEXT,
    listingstatus TEXT,
    companystatus TEXT,
    statecode TEXT,
    country TEXT,
    nic_code TEXT,
    principal_business_activity TEXT
);

DROP TABLE IF EXISTS pincode_district;

CREATE TABLE pincode_district (
    city TEXT,
    pincode INT,
    district TEXT,
    state TEXT,
    country TEXT
);