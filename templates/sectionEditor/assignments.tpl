{**
 * assignments.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Active editorial assignments.
 *
 * $Id$
 *}

{if $showCompleted}
{assign var="pageTitle" value="sectionEditor.completedEditorialAssignments"}
{else}
{assign var="pageTitle" value="sectionEditor.activeEditorialAssignments"}
{/if}
{include file="common/header.tpl"}

<table width="100%">
<tr class="heading">
	<td>{translate key="common.id"}</td>
	<td><a href="{$pageUrl}/sectionEditor/activeAssignments?sort=section">{translate key="editor.article.section"}</a></td>
	<td><a href="{$pageUrl}/sectionEditor/activeAssignments?sort=author">{translate key="editor.article.authors"}</a></td>
	<td><a href="{$pageUrl}/sectionEditor/activeAssignments?sort=submitted">{translate key="editor.article.submitted"}</a></td>
	<td>{translate key="editor.article.editorReview"}</td>
	<td>{translate key="editor.article.copyedit"}</td>
	<td>{translate key="editor.article.layoutAndProof"}</td>
</tr>
{foreach from=$assignedArticles item=article}
<tr class="{cycle values="row,rowAlt"}">
	<td><a href="{$pageUrl}/sectionEditor/editSubmission/{$article->getArticleID()}">{$article->getArticleID()}</a></td>
	<td>{$article->getSectionName()}</a></td>
	<td>{$article->getAuthorNames()}</td>
	<td>{$article->getDateSubmitted()|date_format:$dateFormatShort}</td>
	<td>{if $article->getEdReviewDate()}{$article->getEdReviewDate()|date_format:$dateFormatShort}{else}-{/if}</td>
	<td>{if $article->getCopyEdDate()}{$article->getCopyEdDate()|date_format:$dateFormatShort}{else}-{/if}</td>
	<td>{if $article->getLayoutProofDate()}{$article->getLayoutProofDate()|date_format:$dateFormatShort}{else}-{/if}</td>
</tr>
{foreachelse}
<tr>
<td colspan="7" class="noResults">{translate key="sectionEditor.noneAssigned"}</td>
</tr>
{/foreach}
</table>

{include file="common/footer.tpl"}
