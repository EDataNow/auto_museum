json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :title, :position, :video, :pdf, :audio, :story_id
  json.url chapter_url(chapter, format: :json)
end
