package com.iardo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.iardo.config.ContentfulConstants;
import com.iardo.model.BlogPost;
import com.iardo.parser.ContentfulRichTextParser;
import com.iardo.util.HttpUtil;

public class ContentfulService {

	public List<BlogPost> getAllBlogs() throws Exception {

		String url = ContentfulConstants.BASE_URL + "/entries" + "?content_type=" + ContentfulConstants.CONTENT_TYPE
				+ "&order=-fields.publishedDate" + "&include=1" + "&access_token=" + ContentfulConstants.ACCESS_TOKEN;

		String json = HttpUtil.get(url);

		return parseEntries(new JSONObject(json));
	}

	public BlogPost getBlogBySlug(String slug) throws Exception {

		String url = ContentfulConstants.BASE_URL + "/entries" + "?content_type=" + ContentfulConstants.CONTENT_TYPE
				+ "&fields.slug=" + slug + "&include=1" + "&access_token=" + ContentfulConstants.ACCESS_TOKEN;

		String json = HttpUtil.get(url);
		/* System.out.println(json); */

		List<BlogPost> blogs = parseEntries(new JSONObject(json));

		/*
		 * System.out.println("Blog size = " + blogs.size()); System.out.println(url);
		 */

		/*
		 * if (!blogs.isEmpty()) { System.out.println("Inside getBlogBySlug()");
		 * System.out.println("Title = " + blogs.get(0).getTitle());
		 * System.out.println("Content = " + blogs.get(0).getContentHtml()); }
		 */

		return blogs.isEmpty() ? null : blogs.get(0);
	}

	private List<BlogPost> parseEntries(JSONObject response) {

		List<BlogPost> blogs = new ArrayList<>();

		Map<String, String> assetMap = new HashMap<>();

		// ---------------- Assets ----------------
		JSONObject includes = response.optJSONObject("includes");

		if (includes != null) {

			JSONArray assets = includes.optJSONArray("Asset");

			if (assets != null) {

				for (int i = 0; i < assets.length(); i++) {

					JSONObject asset = assets.getJSONObject(i);

					String id = asset.getJSONObject("sys").optString("id", "");

					JSONObject fields = asset.optJSONObject("fields");

					if (fields == null)
						continue;

					JSONObject file = fields.optJSONObject("file");

					if (file == null)
						continue;

					String imageUrl = file.optString("url", "");

					if (!id.isEmpty() && !imageUrl.isEmpty()) {
						assetMap.put(id, "https:" + imageUrl);
					}
				}
			}
		}

		// ---------------- Blog Entries ----------------

		JSONArray items = response.optJSONArray("items");

		if (items == null)
			return blogs;

		for (int i = 0; i < items.length(); i++) {

			JSONObject item = items.getJSONObject(i);

			JSONObject fields = item.optJSONObject("fields");

			if (fields == null)
				continue;

			BlogPost blog = new BlogPost();

			// id
			JSONObject sys = item.optJSONObject("sys");

			if (sys != null) {
				blog.setId(sys.optString("id", ""));
			}

			// Contentful fields
			blog.setTitle(fields.optString("internalTitle", ""));
			blog.setSlug(fields.optString("slug", ""));
			blog.setMetaTitle(fields.optString("metaTitle", ""));
			blog.setMetaDescription(fields.optString("metaDescription", ""));
			blog.setShortDescription(fields.optString("shortDescription", ""));
			blog.setCanonicalUrl(fields.optString("canonicalUrl", ""));
			blog.setAuthor(fields.optString("author", ""));
			blog.setPublishedDate(fields.optString("publishedDate", ""));
			blog.setCategory(fields.optString("category", ""));

			if (fields.has("content")) {

				JSONObject richText = fields.getJSONObject("content");

				/*
				 * System.out.println("Rich Text JSON:");
				 * System.out.println(richText.toString(2));
				 */

				String html = ContentfulRichTextParser.toHtml(richText);

				/*
				 * System.out.println("Parsed HTML:"); System.out.println(html);
				 */

				blog.setContentHtml(html);

				/*
				 * System.out.println("Stored HTML:");
				 * System.out.println(blog.getContentHtml());
				 */
			}

			// Featured Image (only if field exists)
			JSONObject imageRef = fields.optJSONObject("featuredImage");

			if (imageRef != null) {

				JSONObject imageSys = imageRef.optJSONObject("sys");

				if (imageSys != null) {

					String assetId = imageSys.optString("id", "");

					blog.setFeaturedImage(assetMap.getOrDefault(assetId, ""));
				}
			}

			// Tags
			JSONArray tagsArray = fields.optJSONArray("tags");

			if (tagsArray != null) {

				List<String> tags = new ArrayList<>();

				for (int j = 0; j < tagsArray.length(); j++) {
					tags.add(tagsArray.optString(j));
				}

				blog.setTags(tags);
			}

			blogs.add(blog);
		}

		return blogs;
	}
}