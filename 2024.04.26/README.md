1 - uuid should be generated when inserting the record.
2 - created_at should have a default value of when the record is inserted.
3 - Many to Many should be without repeating:

```
Song1, Pop
Song1, Pop
SHOULD NOT HAPPEN
```

4 - Please insert this JSON in the metadata of the song:

```json
{
  "title": "Imagine",
  "duration": "3:03",
  "release_date": "1971-10-11",
  "genres": [
    "Soft rock",
    "Pop"
  ],
  "album": {
    "title": "Imagine",
    "release_year": 1971,
    "label": "Apple Records",
    "formats": [
      "LP",
      "CD",
      "Digital"
    ]
  }
}
```
5 - Return the songs which have metadata

```json
{
  "album": ...
}
```

6 - Return the songs which have metadata albums formats and one of the formats is "LP"

```json
{
  {
  "album": {
    "formats": ["LP"...]
  }
}

```