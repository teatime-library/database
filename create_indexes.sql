CREATE VIRTUAL TABLE updated_data_fts USING fts5(Title, Author, content='updated_data', content_rowid='id');

-- Populate the FTS table with existing data
INSERT INTO updated_data_fts(rowid, Title, Author)
SELECT id, Title, Author FROM updated_data;

-- Create a regular index for Language and Extension
CREATE INDEX idx_language_extension ON updated_data(Language, Extension);

-- Create individual indexes for better query flexibility
CREATE INDEX idx_language ON updated_data(Language);
CREATE INDEX idx_extension ON updated_data(Extension);

insert into updated_data_fts(updated_data_fts) values ('optimize'); -- for every FTS table you have (if you have any)
