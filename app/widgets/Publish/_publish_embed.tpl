{$resolved = $embed->resolve()}

<li class="block" id="{$embed->HTMLId}">
    <span class="control active icon gray" onclick="Publish_ajaxHttpRemoveEmbed({$embed->draft_id}, {$embed->id})">
        <i class="material-icons">close</i>
    </span>
    {if="count($resolved->images) > 1"}
        {if="$embed->imagenumber == 0"}
            {$imagenumber = 0}
        {else}
            {$imagenumber = $embed->imagenumber-1}
        {/if}
        <span class="primary icon thumb active color gray"
            onclick="Publish_ajaxEmbedChooseImage({$embed->draft_id}, {$embed->id})"
            style="background-image: url({$resolved->images[$imagenumber]['url']|protectPicture})"
            title="{$resolved->images[$imagenumber]['width']} x {$resolved->images[$imagenumber]['height']} - {$resolved->images[$imagenumber]['size']|sizeToCleanSize}"
            >
            <i class="material-icons">collections</i>
        </span>
    {else}
        {if="!empty($resolved->images)"}
            <span class="primary icon thumb active color gray"
                onclick="Preview_ajaxShow('{$resolved->images[0]['url']}')"
                style="background-image: url({$resolved->images[0]['url']|protectPicture})">
                <i class="material-icons">image</i>
            </span>
        {else}
            <span class="primary icon bubble gray">
                {if="$resolved->providerIcon"}
                    <img src="{$resolved->providerIcon}"/>
                {else}
                    <i class="material-icons">link</i>
                {/if}
            </span>
        {/if}
    {/if}

    <div>
        {if="$resolved->type == 'photo'"}
            <p class="line">{$resolved->images[$embed->imagenumber]['width']} x {$resolved->images[$embed->imagenumber]['height']}</p>
            <p class="line">{$resolved->images[$embed->imagenumber]['size']|sizeToCleanSize}</p>
        {else}
            <p class="line">{$resolved->title}</p>
            <p class="line">{$resolved->description}</p>
        {/if}

        <p class="line">
            {if="$resolved->images[0]['url'] == $embed->url"}
                {$c->__('chats.picture')}
                ·
            {elseif="!empty($resolved->images) && count($resolved->images) > 1"}
                {$c->__('chats.picture')}
                {if="$embed->imagenumber == 0"}
                    -
                {else}
                    {$embed->imagenumber}
                {/if}
                /
                {$resolved->images|count}
                ·
            {/if}
            <a href="{$resolved->url}" target="_blank">
                {$resolved->url}
            </a>
        </p>
    </div>
</li>
