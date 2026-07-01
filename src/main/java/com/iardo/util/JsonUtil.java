package com.iardo.util;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.iardo.model.BlogPost;

public class JsonUtil {

	private JsonUtil() {
	}

	/**
	 * Convert Contentful response into Blog List
	 */
	public static List<BlogPost> parseBlogList(String json) {

		List<BlogPost> blogs = new ArrayList<>();

		JSONObject root = new JSONObject(json);

		JSONArray items = root.getJSONArray("items");

		JSONArray assets = root.has("includes") ? root.getJSONObject("includes").optJSONArray("Asset")
				: new JSONArray();

		for (int i = 0; i < items.length(); i++) {

			JSONObject item = items.getJSONObject(i);

			BlogPost blog = parseBlog(item, assets);

			blogs.add(blog);
		}

		return blogs;
	}

	/**
	 * Convert one blog entry
	 */
	public static BlogPost parseBlog(JSONObject item, JSONArray assets) {

		BlogPost blog = new BlogPost();

		blog.setId(item.getJSONObject("sys").getString("id"));

		JSONObject fields = item.getJSONObject("fields");

		blog.setTitle(fields.optString("internalTitle"));

		blog.setSlug(fields.optString("slug"));

		blog.setMetaTitle(fields.optString("metaTitle"));

		blog.setMetaDescription(fields.optString("metaDescription"));

		blog.setCanonicalUrl(fields.optString("canonicalUrl"));

		blog.setAuthor(fields.optString("author"));

		blog.setPublishedDate(fields.optString("publishedDate"));

		// Tags

		List<String> tags = new ArrayList<>();

		if (fields.has("tags")) {

			JSONArray tagArray = fields.getJSONArray("tags");

			for (int i = 0; i < tagArray.length(); i++) {

				tags.add(tagArray.getString(i));
			}
		}

		blog.setTags(tags);

		// Featured image

		blog.setFeaturedImage(findFirstImage(item, assets));

		// Rich Text

		if (fields.has("content")) {

			blog.setContentHtml(fields.getJSONObject("content").toString());

			// Later we'll replace this with HTML from RichTextParser
		}

		return blog;
	}

	/**
	 * Find image URL from includes.Asset
	 */
	private static String findFirstImage(JSONObject item, JSONArray assets) {

		if (assets == null)
			return "";

		if (assets.length() == 0)
			return "";

		JSONObject asset = assets.getJSONObject(0);

		String url = asset.getJSONObject("fields").getJSONObject("file").getString("url");

		return "https:" + url;
	}

}