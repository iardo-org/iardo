package com.iardo.parser;

import org.json.JSONArray;
import org.json.JSONObject;

public class ContentfulRichTextParser {

	public static String toHtml(JSONObject document) {
		StringBuilder sb = new StringBuilder();
		renderNodes(document.optJSONArray("content"), sb);
		return sb.toString();
	}

	private static void renderNodes(JSONArray nodes, StringBuilder sb) {
		if (nodes == null)
			return;
		for (int i = 0; i < nodes.length(); i++) {
			JSONObject node = nodes.optJSONObject(i);
			if (node == null)
				continue;
			switch (node.optString("nodeType", "")) {
			case "paragraph":
				wrap("p", node, sb);
				break;
			case "heading-1":
				wrap("h1", node, sb);
				break;
			case "heading-2":
				wrap("h2", node, sb);
				break;
			case "heading-3":
				wrap("h3", node, sb);
				break;
			case "unordered-list":
				wrap("ul", node, sb);
				break;
			case "ordered-list":
				wrap("ol", node, sb);
				break;
			case "list-item":
				wrap("li", node, sb);
				break;
			case "blockquote":
				wrap("blockquote", node, sb);
				break;
			case "hr":
				sb.append("<hr/>");
				break;

			// ── Table nodes ──────────────────────────────────────
			case "table":
				wrap("table", node, sb);
				break;
			case "table-row":
				wrap("tr", node, sb);
				break;
			case "table-header-cell":
				wrap("th", node, sb);
				break;
			case "table-cell":
				wrap("td", node, sb);
				break;
			// ─────────────────────────────────────────────────────

			case "hyperlink":
				String href = node.optJSONObject("data") != null ? node.getJSONObject("data").optString("uri", "#")
						: "#";
				sb.append("<a href=\"").append(href).append("\" target=\"_blank\">");
				renderNodes(node.optJSONArray("content"), sb);
				sb.append("</a>");
				break;

			case "text":
				String text = escape(node.optString("value", ""));
				JSONArray marks = node.optJSONArray("marks");
				if (marks != null) {
					for (int m = 0; m < marks.length(); m++) {
						switch (marks.getJSONObject(m).optString("type")) {
						case "bold":
							text = "<strong>" + text + "</strong>";
							break;
						case "italic":
							text = "<em>" + text + "</em>";
							break;
						case "underline":
							text = "<u>" + text + "</u>";
							break;
						case "code":
							text = "<code>" + text + "</code>";
							break;
						}
					}
				}
				sb.append(text);
				break;

			default:
				renderNodes(node.optJSONArray("content"), sb);
			}
		}
	}

	private static void wrap(String tag, JSONObject node, StringBuilder sb) {
		sb.append("<").append(tag).append(">");
		renderNodes(node.optJSONArray("content"), sb);
		sb.append("</").append(tag).append(">");
	}

	private static String escape(String s) {
		return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
	}
}