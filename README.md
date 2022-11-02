
# Documentation

## GetUserGeoID

- <https://learn.microsoft.com/en-us/windows/win32/api/winnls/nf-winnls-getusergeoid>
- GEOCLASS_NATION

## SYSGEOTYPE

- <https://learn.microsoft.com/en-us/windows/win32/api/winnls/ne-winnls-sysgeotype>

> **GEO_NATION**
> Value: ``0x0001``

```text
The geographical location identifier (GEOID) of a nation. This value is stored in a long integer.

Starting with Windows 10, version 1709: This value is not supported for the GetGeoInfoEx function, and should not be used.
```

> **GEO_LATITUDE**
> Value: ``0x0002``

```text
The latitude of the location. This value is stored in a floating-point number.
```

> **GEO_LONGITUDE**
> Value: ``0x0003``

```text
The longitude of the location. This value is stored in a floating-point number.
```

> **GEO_ISO2**
> Value: ``0x0004``

```text
The ISO 2-letter country/region code. This value is stored in a string.
```

> **GEO_ISO3**
> Value: ``0x0005``

```text
The ISO 3-letter country/region code. This value is stored in a string.
```

> **GEO_RFC1766**
> Value: ``0x0006``

```text
The name for a string, compliant with RFC 4646 (starting with Windows Vista), that is derived from the GetGeoInfo parameters language and GeoId.

Starting with Windows 10, version 1709: This value is not supported for the GetGeoInfoEx function, and should not be used.
```

> **GEO_LCID**
> Value: ``0x0007``

```text
A locale identifier derived using GetGeoInfo.

Starting with Windows 10, version 1709: This value is not supported for the GetGeoInfoEx function, and should not be used.
```

> **GEO_FRIENDLYNAME**
> Value: ``0x0008``

```text
The friendly name of the nation, for example, Germany. This value is stored in a string.
```

> **GEO_OFFICIALNAME**
> Value: ``0x0009``

```text
The official name of the nation, for example, Federal Republic of Germany. This value is stored in a string.
```

> **GEO_TIMEZONES**
> Value: ``0x000A``

```text
Not implemented.
```

> **GEO_OFFICIALLANGUAGES**
> Value: ``0x000B``

```text
Not implemented.
```

> **GEO_ISO_UN_NUMBER**
> Value: ``0x000C``

```text
Starting with Windows 8: The ISO 3-digit country/region code. This value is stored in a string.
```

> **GEO_PARENT**
> Value: ``0x000D``

```text
Starting with Windows 8: The geographical location identifier of the parent region of a country/region. This value is stored in a string.
```

> **GEO_DIALINGCODE**
> Value: ``0x000E``

```text
Starting with Windows 10, version 1709: The dialing code to use with telephone numbers in the geographic location. For example, 1 for the United States.
```

> **GEO_CURRENCYCODE**
Value: ``0x000F``

```text
Starting with Windows 10, version 1709: The three-letter code for the currency that the geographic location uses. For example, USD for United States dollars.
```

> **GEO_CURRENCYSYMBOL**
Value: 0x0010

```text
Starting with Windows 10, version 1709: The symbol for the currency that the geographic location uses. For example, the dollar sign ($).
```

> **GEO_NAME**
Value: 0x0011

```text
Starting with Windows 10, version 1709: The two-letter International Organization for Standardization (ISO) 3166-1 code or numeric United Nations (UN) Series M, Number 49 (M.49) code for the geographic region.

For information about two-letter ISO 3166-1 codes, see Country Codes - ISO 3166. For information about numeric UN M.49 codes, see Standard country or area codes for statistical use (M49).
```

> **GEO_ID**
Value: `0x0012`

```text
Starting with Windows 10, version 1709: The Windows geographical location identifiers (GEOID) for the region. This value is provided for backward compatibility. Do not use this value in new applications, but use GEO_NAME instead.
```

## GetInfoTimeZone

> return ``according to the definition of your machine settings``

 ```json
 "id": id,
 "name": Hora oficial do Brasil,
 "time_zones": [Brasilia]
 "time_zone_name": E. South America Standard Time,
 "time": 09:49:41,
 "datetime": 2022-10-24T09:49:41.000
 "year": 2022,
 "month": 10,
 "day":  24,
 "utc": -3,
```

## GET_LOCALE_NAME

> return

```text
  according to the definition of your machine settings
  example:  pt-BR | en-us etc...
```

## GET_GEO_DEVICE_WIN_RT

> return

```text
Latitude and Longitude
Check permission location
Open view enable location
```
